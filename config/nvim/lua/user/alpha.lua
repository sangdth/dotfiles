local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

function M.config()
  local dashboard = require "alpha.themes.dashboard"
  local icons = require "user.icons"

  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Include"
    return b
  end

  dashboard.section.header.val = {
 [[                                                      .                        ]],
 [[                                        .            @88o                      ]],
 [[    u.    u.                   _u.    88Nu.   u.     08P     ..    .     .     ]],
 [[  x@88k u@88c.      .u     ...ue888b  "88888  888c    .     .888: x888  x888.  ]],
 [[ ^"8888""8888"   ud8888.   888R Y888r  ^8888  8888  .@88u  ~`8888~"888X`?888f` ]],
 [[   8888  888R  :888 8888.  888R I888>   8888  8888 ''888E`   X888  888X  888>  ]],
 [[   8888  888R  d888  88%"  888R I888>   8888  8888   888E    X888  888X  888>  ]],
 [[   8888  888R  8888.+""    888R I888>   8888  8888   888E    X888  888X  888>  ]],
 [[   8888  888R  8888L      u8888cJ888   .8888b.888P   888E    X888  888X  888>  ]],
 [[  "*88*  8888" "8888c. .+  "*888*P"     ^Y8888*""    888& . "*88%  *88"  888!` ]],
 [[    ""   "Y"    "88888%      "Y"          `Y"        R888"    `~    "    `"`   ]],
 [[                  "YP"                                ""                       ]],
  }

  dashboard.section.buttons.val = {
    button("f", icons.ui.Files .. " Find file", ":Telescope find_files <CR>"),
    button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
    button("p", icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
    button("t", icons.ui.Text .. " Find text", ":Telescope live_grep <CR>"),
    button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
    button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
  }
  local function footer()
    return "chrisatmachine.com"
  end

  dashboard.section.footer.val = footer()

  dashboard.section.header.opts.hl = "Keyword"
  dashboard.section.buttons.opts.hl = "Include"
  dashboard.section.footer.opts.hl = "Type"

  dashboard.opts.opts.noautocmd = true
  require("alpha").setup(dashboard.opts)

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.cmd [[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
    end,
  })
end

return M
