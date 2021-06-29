local bar_fg = "#565c64"
local activeBuffer_fg = "#ffffff" 

require "bufferline".setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "Explorer"}},
        buffer_close_icon = "",
        modified_icon = "",
        -- close_icon = "  ",
        left_trunc_marker = "",
        right_trunc_marker = "",
        show_close_icon = false,
        max_name_length = 20,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        mappings = "true"
    },
    -- bar colors!!
    highlights = {
        fill = {
            guifg = bar_fg,
            guibg = "NONE"
        },
        background = {
            guifg = bar_fg,
            guibg = "NONE"
        },
        -- buffer
        buffer_selected = {
            guifg = activeBuffer_fg,
            guibg = "#236e00",
            gui = "bold"
        },
        buffer_visible = {
            guifg = "#f00",
            guibg = "NONE"
        },
        -- tabs over right
        tab = {
            guifg = "#9298a0",
            guibg = "NONE"
        },
        tab_selected = {
            guifg = "#30343c",
            guibg = "#9298a0"
        },
        tab_close = {
            guifg = "#f9929b",
            guibg = "#252931"
        },
        -- buffer separators
        separator = {
            guifg = "#252931",
            guibg = "#252931"
        },
        separator_selected = {
            guifg = "#1e222a",
            guibg = "#1e222a"
        },
        separator_visible = {
            guifg = "#252931",
            guibg = "#252931"
        },
        indicator_selected = {
            guifg = "#252931",
            guibg = "#252931"
        },
        -- modified files (but not saved)
        modified = {
            guifg = "#ff6600",
            guibg = "NONE"
        },
        modified_selected = {
            guifg = "#ff6600",
            guibg = "#236e00"
        },
        modified_visible = {
            guifg = "#ff0000",
            guibg = "NONE"
        }
    }
}

local opt = {silent = true}
local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "

-- MAPPINGS
map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
map("n", "<Right>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<Left>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

