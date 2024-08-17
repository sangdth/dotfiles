return {
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    config = function()
      local icons = require "sang.utils.icons"
      require("nvim-tree").setup {
        hijack_cursor = true,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = true,
        sync_root_with_cwd = false,
        view = {
          relativenumber = true,
          adaptive_size = true,
        },
        renderer = {
          add_trailing = false,
          group_empty = false,
          highlight_git = false,
          full_name = false,
          highlight_opened_files = "none",
          root_folder_label = ":t",
          indent_width = 2,
          indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              none = " ",
            },
          },
          icons = {
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            glyphs = {
              default = icons.ui.Text,
              symlink = icons.ui.FileSymlink,
              bookmark = icons.ui.BookMark,
              folder = {
                arrow_closed = icons.ui.ChevronRight,
                arrow_open = icons.ui.ChevronShortDown,
                default = icons.ui.Folder,
                open = icons.ui.FolderOpen,
                empty = icons.ui.EmptyFolder,
                empty_open = icons.ui.EmptyFolderOpen,
                symlink = icons.ui.FolderSymlink,
                symlink_open = icons.ui.FolderOpen,
              },
              git = {
                unstaged = icons.git.FileUnstaged,
                staged = icons.git.FileStaged,
                unmerged = icons.git.FileUnmerged,
                renamed = icons.git.FileRenamed,
                untracked = icons.git.FileUntracked,
                deleted = icons.git.FileDeleted,
                ignored = icons.git.FileIgnored,
              },
            },
          },
          special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
          symlink_destination = true,
        },
        update_focused_file = {
          enable = true,
          debounce_delay = 15,
          update_root = false,
          ignore_list = {},
        },
        diagnostics = {
          enable = true,
          show_on_dirs = false,
          show_on_open_dirs = true,
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = icons.diagnostics.Hint,
            info = icons.diagnostics.Information,
            warning = icons.diagnostics.Warning,
            error = icons.diagnostics.Error,
          },
        },
        filters = {
          dotfiles = true,
          git_ignored = true,
          custom = { ".DS_Store", "__init__.py", ".venv" },
          exclude = { ".env" },
        },
        git = {
          enable = true, -- need this for git.ignore and filters.git_ignore has effect
          ignore = true,
          timeout = 600, -- some big repo need longer than 200ms
        },
      }
    end,
  },
}
