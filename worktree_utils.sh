# need to make this work with zsh 
# Helper: In-place sed that works reliably on macOS
_sed_inplace() {
  local pattern="$1"
  local file="$2"
  sed -i.bak "$pattern" "$file" && rm -f "$file.bak"
}

# Helper functions (internal)
_sanitize_db_name() {
  # Sanitize and truncate to 41 chars (63 - 22 for "operating_test_shadow_" prefix)
  echo "$1" | tr '/-' '__' | tr '[:upper:]' '[:lower:]' | cut -c1-41
}


_sed_inplace() {
  sed -i.bak "$1" "$2" && rm -f "$2.bak"
}

_copy_node_modules() {
  local src="$1" dest="$2"
  echo "Cloning node_modules (APFS copy-on-write)..."
  [ -d "$src/node_modules" ] && cp -cR "$src/node_modules" "$dest/"
  [ -d "$src/client/node_modules" ] && cp -cR "$src/client/node_modules" "$dest/client/"
  [ -d "$src/server/node_modules" ] && cp -cR "$src/server/node_modules" "$dest/server/"
  [ -d "$src/shared/node_modules" ] && cp -cR "$src/shared/node_modules" "$dest/shared/"
  echo "  ✅ node_modules cloned"
}

# Main command with subcommands
function worktree() {
  local cmd="$1"
  shift 2>/dev/null
  
  case "$cmd" in
    stack) _wt_stack "$@" ;;
    rm)    _wt_rm "$@" ;;
    ls)    _wt_ls ;;
    help)  _wt_help ;;
    *)     _wt_checkout "$cmd" ;;  # default: treat as branch name
  esac
}

_wt_help() {
  echo "Usage: worktree <command> [args]"
  echo ""
  echo "Commands:"
  echo "  <branch>      Checkout branch into new worktree (default)"
  echo "  stack <name>  Create stacked branch and worktree"
  echo "  rm <branch>   Remove worktree and its databases"
  echo "  ls            List all worktrees with databases"
  echo "  help          Show this help"
  echo ""
  echo "Each worktree gets isolated:"
  echo "  - Development database (operating_dev_<branch>)"
  echo "  - Test database (operating_test_<branch>)"
  echo "  - Test shadow database (operating_test_shadow_<branch>)"
  echo "  - Redis key prefix (wt_<branch>)"
  echo ""
  echo "This allows running tests in parallel across worktrees."
}

_wt_checkout() {
  if [ -z "$1" ]; then
    _wt_help
    return 1
  fi

# we need to allow to customize at least these things:
# 1. the root of worktrees, `$WORKTREE_ROOT`
  local BRANCH="$1"
  local REPO_DIR="$(git rev-parse --show-toplevel)"
  local REPO_NAME="$(basename "$REPO_DIR")"
  local WORKTREE_DIR="$HOME/code/worktrees/$REPO_NAME/$BRANCH"
  
  local SOURCE_DB="operating-dev-2"
  local SANITIZED_NAME="$(_sanitize_db_name "$BRANCH")"
  local DB_NAME="operating_dev_$SANITIZED_NAME"
  local TEST_DB_NAME="operating_test_$SANITIZED_NAME"
  local TEST_DB_SHADOW_NAME="operating_test_shadow_$SANITIZED_NAME"
  local REDIS_KEY_PREFIX="wt_$SANITIZED_NAME"
  local DB_HOST="localhost" DB_PORT="5432" DB_USER="postgres" DB_PASS="postgres"

  if [ -d "$WORKTREE_DIR" ]; then
    echo "Worktree already exists at $WORKTREE_DIR"
    itermocil-here 4p-monorepo "$WORKTREE_DIR"
    cursor -n "$WORKTREE_DIR"
    return 0
  fi

  mkdir -p "$HOME/code/worktrees/$REPO_NAME"

  echo "Creating worktree..."
  git worktree add -B "$BRANCH" "$WORKTREE_DIR" "$BRANCH" 2>/dev/null || \
  git worktree add -B "$BRANCH" "$WORKTREE_DIR" "origin/$BRANCH" 2>/dev/null || \
  git worktree add -B "$BRANCH" "$WORKTREE_DIR" "origin/main"

  echo "Creating development database $DB_NAME..."
  PGPASSWORD="$DB_PASS" createdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$DB_NAME" 2>/dev/null
  PGPASSWORD="$DB_PASS" pg_dump -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$SOURCE_DB" | \
    PGPASSWORD="$DB_PASS" psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -q
  [ $? -eq 0 ] && echo "  ✅ Development database created" || echo "  ⚠️  Development database creation failed"

  echo "Creating test databases..."
  PGPASSWORD="$DB_PASS" createdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$TEST_DB_NAME" 2>/dev/null
  [ $? -eq 0 ] && echo "  ✅ Test database created: $TEST_DB_NAME" || echo "  ⚠️  Test database creation failed"
  PGPASSWORD="$DB_PASS" createdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$TEST_DB_SHADOW_NAME" 2>/dev/null
  [ $? -eq 0 ] && echo "  ✅ Test shadow database created: $TEST_DB_SHADOW_NAME" || echo "  ⚠️  Test shadow database creation failed"

  _copy_node_modules "$REPO_DIR" "$WORKTREE_DIR"

  echo "Configuring .env files..."
  if [ -f "$REPO_DIR/server/.env" ]; then
    cp "$REPO_DIR/server/.env" "$WORKTREE_DIR/server/.env"
    _sed_inplace "s|^DATABASE_URL=.*|DATABASE_URL=\"postgresql://$DB_USER:$DB_PASS@$DB_HOST:$DB_PORT/$DB_NAME\"|" "$WORKTREE_DIR/server/.env"
    # Add worktree-specific test config
    echo "" >> "$WORKTREE_DIR/server/.env"
    echo "# Worktree-specific configuration for parallel test execution" >> "$WORKTREE_DIR/server/.env"
    echo "TEST_DATABASE_NAME=$TEST_DB_NAME" >> "$WORKTREE_DIR/server/.env"
    echo "TEST_DATABASE_SHADOW_NAME=$TEST_DB_SHADOW_NAME" >> "$WORKTREE_DIR/server/.env"
    echo "REDIS_KEY_PREFIX=$REDIS_KEY_PREFIX" >> "$WORKTREE_DIR/server/.env"
  fi
  if [ -f "$REPO_DIR/client/.env" ]; then
    cp "$REPO_DIR/client/.env" "$WORKTREE_DIR/client/.env"
  fi

  echo "$DB_NAME" > "$WORKTREE_DIR/.worktree-db-name"
  echo "$TEST_DB_NAME" > "$WORKTREE_DIR/.worktree-test-db-name"

  npm run build --prefix "$WORKTREE_DIR/server"

  echo ""
  echo "✅ Worktree ready: $WORKTREE_DIR"
  echo "   Dev database: $DB_NAME"
  echo "   Test database: $TEST_DB_NAME"
  echo "   Redis prefix: $REDIS_KEY_PREFIX"
  
  itermocil-here 4p-monorepo "$WORKTREE_DIR"
  cursor -n "$WORKTREE_DIR"
}

_wt_stack() {
  if [ -z "$1" ]; then
    echo "Usage: worktree stack <new-branch-name>"
    return 1
  fi

  local NEW_BRANCH="$1"
  local CURRENT_BRANCH="$(git branch --show-current)"
  local REPO_DIR="$(git rev-parse --show-toplevel)"
  local REPO_NAME="$(basename "$REPO_DIR")"
  local WORKTREE_DIR="$HOME/code/worktrees/$REPO_NAME/$NEW_BRANCH"
  
  local SOURCE_DB="operating-dev-2"
  local SANITIZED_NAME="$(_sanitize_db_name "$NEW_BRANCH")"
  local DB_NAME="operating_dev_$SANITIZED_NAME"
  local TEST_DB_NAME="operating_test_$SANITIZED_NAME"
  local TEST_DB_SHADOW_NAME="operating_test_shadow_$SANITIZED_NAME"
  local REDIS_KEY_PREFIX="wt_$SANITIZED_NAME"
  local DB_HOST="localhost" DB_PORT="5432" DB_USER="postgres" DB_PASS="postgres"

  echo "Creating stacked branch $NEW_BRANCH on $CURRENT_BRANCH..."
  gt branch create "$NEW_BRANCH" || { echo "Failed to create branch"; return 1; }
  git push -u origin "$NEW_BRANCH"
  gt checkout "$CURRENT_BRANCH"

  mkdir -p "$HOME/code/worktrees/$REPO_NAME"

  echo "Creating worktree..."
  git worktree add "$WORKTREE_DIR" "$NEW_BRANCH"

  echo "Creating development database $DB_NAME..."
  PGPASSWORD="$DB_PASS" createdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$DB_NAME" 2>/dev/null
  PGPASSWORD="$DB_PASS" pg_dump -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$SOURCE_DB" | \
    PGPASSWORD="$DB_PASS" psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -q
  [ $? -eq 0 ] && echo "  ✅ Development database created" || echo "  ⚠️  Development database creation failed"

  echo "Creating test databases..."
  PGPASSWORD="$DB_PASS" createdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$TEST_DB_NAME" 2>/dev/null
  [ $? -eq 0 ] && echo "  ✅ Test database created: $TEST_DB_NAME" || echo "  ⚠️  Test database creation failed"
  PGPASSWORD="$DB_PASS" createdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$TEST_DB_SHADOW_NAME" 2>/dev/null
  [ $? -eq 0 ] && echo "  ✅ Test shadow database created: $TEST_DB_SHADOW_NAME" || echo "  ⚠️  Test shadow database creation failed"

  _copy_node_modules "$REPO_DIR" "$WORKTREE_DIR"

  echo "Configuring .env files..."
  if [ -f "$REPO_DIR/server/.env" ]; then
    cp "$REPO_DIR/server/.env" "$WORKTREE_DIR/server/.env"
    _sed_inplace "s|^DATABASE_URL=.*|DATABASE_URL=\"postgresql://$DB_USER:$DB_PASS@$DB_HOST:$DB_PORT/$DB_NAME\"|" "$WORKTREE_DIR/server/.env"
    # Add worktree-specific test config
    echo "" >> "$WORKTREE_DIR/server/.env"
    echo "# Worktree-specific configuration for parallel test execution" >> "$WORKTREE_DIR/server/.env"
    echo "TEST_DATABASE_NAME=$TEST_DB_NAME" >> "$WORKTREE_DIR/server/.env"
    echo "TEST_DATABASE_SHADOW_NAME=$TEST_DB_SHADOW_NAME" >> "$WORKTREE_DIR/server/.env"
    echo "REDIS_KEY_PREFIX=$REDIS_KEY_PREFIX" >> "$WORKTREE_DIR/server/.env"
  fi
  if [ -f "$REPO_DIR/client/.env" ]; then
    cp "$REPO_DIR/client/.env" "$WORKTREE_DIR/client/.env"
  fi

  echo "$DB_NAME" > "$WORKTREE_DIR/.worktree-db-name"
  echo "$TEST_DB_NAME" > "$WORKTREE_DIR/.worktree-test-db-name"

  echo ""
  echo "✅ Stacked worktree ready: $WORKTREE_DIR"
  echo "   Parent: $CURRENT_BRANCH"
  echo "   Dev database: $DB_NAME"
  echo "   Test database: $TEST_DB_NAME"
  echo "   Redis prefix: $REDIS_KEY_PREFIX"
  
  itermocil-here 4p-monorepo "$WORKTREE_DIR"
  cursor -n "$WORKTREE_DIR"
}

_wt_rm() {
  if [ -z "$1" ]; then
    echo "Usage: worktree rm <branch>"
    return 1
  fi

  local BRANCH="$1"
  local REPO_NAME="$(basename "$(git rev-parse --show-toplevel)")"
  local WORKTREE_DIR="$HOME/code/worktrees/$REPO_NAME/$BRANCH"
  local DB_HOST="localhost" DB_PORT="5432" DB_USER="postgres" DB_PASS="postgres"
  local SANITIZED_NAME="$(_sanitize_db_name "$BRANCH")"

  local DB_NAME
  [ -f "$WORKTREE_DIR/.worktree-db-name" ] && DB_NAME="$(cat "$WORKTREE_DIR/.worktree-db-name")" || \
    DB_NAME="operating_dev_$SANITIZED_NAME"

  local TEST_DB_NAME
  [ -f "$WORKTREE_DIR/.worktree-test-db-name" ] && TEST_DB_NAME="$(cat "$WORKTREE_DIR/.worktree-test-db-name")" || \
    TEST_DB_NAME="operating_test_$SANITIZED_NAME"
  local TEST_DB_SHADOW_NAME="operating_test_shadow_$SANITIZED_NAME"

  echo "Dropping development database $DB_NAME..."
  PGPASSWORD="$DB_PASS" dropdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" --if-exists "$DB_NAME"
  [ $? -eq 0 ] && echo "  ✅ Development database dropped" || echo "  ⚠️  Failed to drop development database"

  echo "Dropping test databases..."
  PGPASSWORD="$DB_PASS" dropdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" --if-exists "$TEST_DB_NAME"
  [ $? -eq 0 ] && echo "  ✅ Test database dropped" || echo "  ⚠️  Failed to drop test database"
  PGPASSWORD="$DB_PASS" dropdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" --if-exists "$TEST_DB_SHADOW_NAME"
  [ $? -eq 0 ] && echo "  ✅ Test shadow database dropped" || echo "  ⚠️  Failed to drop test shadow database"

  echo "Removing worktree..."
  git worktree remove "$WORKTREE_DIR" --force
  [ -d "$WORKTREE_DIR" ] && rm -rf "$WORKTREE_DIR"

  echo "✅ Removed worktree and databases for $BRANCH"
}

_wt_ls() {
  local REPO_NAME="$(basename "$(git rev-parse --show-toplevel)")"
  local WORKTREES_BASE="$HOME/code/worktrees/$REPO_NAME"
  
  echo "Worktrees for $REPO_NAME:"
  echo "========================="
  
  git worktree list --porcelain | grep "^worktree" | cut -d" " -f2 | while read -r dir; do
    if [[ "$dir" == "$WORKTREES_BASE"* ]]; then
      local branch=$(basename "$dir")
      local db_name="N/A"
      local test_db_name="N/A"
      local redis_prefix="N/A"
      
      [ -f "$dir/.worktree-db-name" ] && db_name=$(cat "$dir/.worktree-db-name")
      [ -f "$dir/.worktree-test-db-name" ] && test_db_name=$(cat "$dir/.worktree-test-db-name")
      [ -f "$dir/server/.env" ] && redis_prefix=$(grep "^REDIS_KEY_PREFIX=" "$dir/server/.env" 2>/dev/null | cut -d= -f2)
      
      echo ""
      echo "  $branch"
      echo "    Dev DB: $db_name"
      echo "    Test DB: $test_db_name"
      echo "    Redis prefix: ${redis_prefix:-N/A}"
    fi
  done
}

# Completion
_worktree_complete() {
  local -a subcmds branches worktrees
  subcmds=(stack rm ls help)
  
  if [ "$CURRENT" -eq 2 ]; then
    # First argument: show subcommands + branches
    branches=("${(@f)$(git for-each-ref --format='%(refname:short)' refs/heads refs/remotes 2>/dev/null)}")
    branches=("${(@u)${branches[@]#origin/}}")
    compadd -- $subcmds $branches
  elif [ "$CURRENT" -eq 3 ]; then
    # Second argument: depends on subcommand
    case "${words[2]}" in
      rm)
        local repo_name="$(basename "$(git rev-parse --show-toplevel 2>/dev/null)")"
        [ -d "$HOME/code/worktrees/$repo_name" ] && \
          worktrees=("${(@f)$(ls "$HOME/code/worktrees/$repo_name" 2>/dev/null)}")
        compadd -- $worktrees
        ;;
      stack)
        # No completion for new branch name
        ;;
      *)
        branches=("${(@f)$(git for-each-ref --format='%(refname:short)' refs/heads refs/remotes 2>/dev/null)}")
        branches=("${(@u)${branches[@]#origin/}}")
        compadd -- $branches
        ;;
    esac
  fi
}

compdef _worktree_complete worktree