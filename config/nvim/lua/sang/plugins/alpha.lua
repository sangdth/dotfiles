return {
  "goolord/alpha-nvim",
  event = "VimEnter",

  config = function()
    local dashboard = require "alpha.themes.dashboard"
    local icons = require "sang.utils.icons"

    local function button(sc, txt, keybind, keybind_opts)
      local b = dashboard.button(sc, txt, keybind, keybind_opts)
      b.opts.hl_shortcut = "Include"
      return b
    end

    dashboard.section.header.val = {
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                       ▄                                       ]],
      [[                                     ▄▄█▄▄                                     ]],
      [[                                       █                                       ]],
      [[                                       █                                       ]],
      [[                                       ▀                                       ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
      [[                                                                               ]],
    }

    dashboard.section.buttons.val = {
      button("f", icons.find.File .. "  Find file", ":Telescope find_files <CR>"),
      button("n", icons.ui.NewFile .. "  New file", ":ene <BAR> startinsert <CR>"),
      button(
        "p",
        icons.find.Project .. "  Find project",
        ":lua require('telescope').extensions.projects.projects()<CR>"
      ),
      -- button("r", icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>"),
      button("t", icons.find.Text .. "  Find text", ":Telescope live_grep <CR>"),
      button("c", icons.ui.Gear .. "  Config", ":e ~/.config/nvim/init.lua <CR>"),
      button("q", icons.ui.SignOut .. "  Quit", ":qa<CR>"),
    }

    dashboard.section.footer.val = ""
    dashboard.section.header.opts.hl = "Keyword"
    dashboard.section.buttons.opts.hl = "Include"
    dashboard.section.footer.opts.hl = "Type"

    dashboard.opts.opts.noautocmd = true
    require("alpha").setup(dashboard.opts)
  end,
}
