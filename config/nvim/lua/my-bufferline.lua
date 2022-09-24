local gray = "#565c64"
local black = "#252931"
local white = "#ffffff" 
local green = "#236e00"
local orange = "#ff6600"

require "bufferline".setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "Explorer"}},
        buffer_close_icon = "",
        modified_icon = "",
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
    },
    -- bar colors!!
    highlights = {
        fill = {
            guifg = gray,
            guibg = "NONE"
        },
        background = {
            guifg = gray,
            guibg = "NONE"
        },
        -- buffer
        buffer_selected = {
            guifg = white,
            guibg = green,
            gui = "bold"
        },
        buffer_visible = {
            guifg = gray,
            guibg = "NONE"
        },
        close_button = {
            guifg = gray,
            guibg = "NONE"
        },
        close_button_visible = {
            guifg = gray,
            guibg = "NONE"
        },
        close_button_selected = {
            guifg = white,
            guibg = green
        },
        -- tabs over right
        tab = {
            guifg = "#9298a0",
            guibg = "#ffff00"
        },
        tab_selected = {
            guifg = "#30343c",
            guibg = "#9298a0"
        },
        tab_close = {
            guifg = "#f9929b",
            guibg = "#ff00ff"
        },
        -- buffer separators
        separator = {
            guifg = black,
            guibg = "NONE"
        },
        separator_selected = {
            guifg = "#1e222a",
            guibg = green
        },
        separator_visible = {
            guifg = black,
            guibg = green
        },
        indicator_selected = {
            guifg = black,
            guibg = green
        },
        -- modified files (but not save)
        modified = {
            guifg = orange,
            guibg = "NONE"
        },
        modified_selected = {
            guifg = orange,
            guibg = green
        },
        modified_visible = {
            guifg = orange,
            guibg = "NONE"
        }
    }
}

local opt = {silent = true}
local map = vim.api.nvim_set_keymap
-- vim.g.mapleader = " "

-- MAPPINGS
map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
map("n", "<Right>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<Left>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
