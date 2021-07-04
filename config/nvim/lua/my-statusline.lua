local gl = require("galaxyline")
local gls = gl.section

gl.short_line_list = {""} -- keeping this table { } as empty will show inactive statuslines

local colors = {
    bg      = "#282c34",
    white   = "#abb2bf",
    lightBg = "#373b41",
    black   = "#161821",
    green   = "#98c379",
    orange  = "#e5c07b",
    red     = "#e06c75",
    blue    = "#61afef",
    cyan    = "#56c6b2",
    violet  = "#c678dd"
}

local map_mode = {
    ['n']  = {'NORMAL',   colors.green},
    ['i']  = {'INSERT',   colors.blue},
    ['r']  = {'REPLACE',  colors.orange},
    ['R']  = {'REPLACE',  colors.orange}, -- wtf is this
    ['v']  = {'VISUAL',   colors.violet},
    ['V']  = {'V-LINE',   colors.violet},
    ['c']  = {'COMMAND',  colors.red},
    ['s']  = {'SELECT',   colors.orange},
    ['S']  = {'S-LINE',   colors.orange},
    ['t']  = {'TERMINAL', colors.cyan},
    [''] = {'V-BLOCK',  colors.violet},
    [''] = {'S-BLOCK',  colors.violet},
    ['Rv'] = {'VIRTUAL',  colors.cyan},
    ['rm'] = {'--MORE',   colors.cyan}
}

local function mode_label() 
    local label = 'N/A'
    local mode = map_mode[vim.fn.mode()]
    if mode ~= nil then
        label = mode[1]
    end
    return label
end
local function mode_highlight()
    local bgColor = colors.cyan
    local mode = map_mode[vim.fn.mode()]
    if mode ~= nil then
        bgColor = mode[2]
    end
    return bgColor
end
local function highlight(group, fg, bg, gui)
    local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
    if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
    vim.cmd(cmd)
end
local function split(str, sep)
    local res = {}
    local n = 1
    for w in str:gmatch('([^' .. sep .. ']*)') do
        res[n] = res[n] or w -- only set once (so the blank after a string is ignored)
        if w == '' then
            n = n + 1
        end -- step forwards on a blank but not a string
    end
    return res
end
local canDisplay = function()
    local isNotTree = require('galaxyline.provider_buffer').get_buffer_filetype() ~= 'NVIMTREE'
    local haveMode = vim.fn.mode() ~= nil
    return isNotTree and haveMode
end
local is_file = function()
    return vim.bo.buftype ~= 'nofile' and canDisplay()
end
local isGit = function()
    return require("galaxyline.condition").check_git_workspace() and canDisplay()
end
local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end
local auto_trim = function (str)
    if str == nil then
        return
    end
    local text = str
    local found = str:match("%((.+)%)")
    if found then
        text = found
    end
    -- if #text > 40 then
    --     text = string.sub(text, 1, 40) .. '…'
    -- end
    return text
end
-- local function trim(s)
--   return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
-- end

gls.left[1] = {
    ViMode = {
        provider = function()
            local bgColor = mode_highlight()
            highlight('GalaxyViMode', colors.black, bgColor, 'bold')
            highlight('GalaxyViModeInv', bgColor, colors.bg, 'bold')
            return string.format('  %s ', mode_label())
        end,
        condition = canDisplay,
        separator = " ",
        separator_highlight = {colors.lightBg, colors.lightBg},
    }
}

gls.left[2] = {
    LineColumn = {
        provider = "LineColumn",
        highlight = {colors.white, colors.lightBg},
        condition = canDisplay,
    }
}

gls.left[3] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = " ",
        highlight = {colors.red, colors.bg},
        separator = " ",
        separator_highlight = {colors.bg, colors.bg},
        condition = canDisplay,
    }
}

gls.left[4] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = " ",
        highlight = {colors.orange, colors.bg},
        condition = canDisplay,
        separator = " ",
        separator_highlight = {colors.bg, colors.bg},
    }
}

gls.left[5] = {
    FilePath = {
        provider = function()
            local fp = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')
            local tbl = split(fp, '/')
            local len = #tbl
            -- TODO: Make the trim.. like comp../Table../cells/Editab../ format
            if len > 2 and not len == 3 and not tbl[0] == '~' then
                return '…/' .. table.concat(tbl, '/', len - 1) .. '/' -- shorten filepath to last 2 folders
                -- alternative: only 1 containing folder using vim builtin function
                -- return '…/' .. vim.fn.fnamemodify(vim.fn.expand '%', ':p:h:t') .. '/'
            else
                return fp .. '/'
            end
        end,
        condition = function()
            return is_file() and checkwidth()
        end,
        highlight = { colors.white, colors.bg },
    },
}

gls.right[1] = {
    GitBlame = {
        provider = function()
            return auto_trim(vim.b.coc_git_blame)
        end,
        condition = isGit,
        highlight = {colors.white, colors.bg},
        separator = " ",
        separator_highlight = {colors.bg, colors.bg},
    }
}

gls.right[2] = {
    GitBranch = {
        provider = function()
            local branchName = require("galaxyline.provider_vcs").get_git_branch() or '!Git'
            local length = 8
            if checkwidth() then
              length = 20
            end
            return  ' ' .. string.sub(branchName, 1, length) -- Make the sub auto detect like responsive(branchName)
        end,
        condition = isGit,
        highlight = {colors.white, colors.lightBg},
        separator = " ",
        separator_highlight = {colors.bg, colors.bg}
    }
}

gls.right[3] = {
    GitIcon = {
        provider = function()
            return "  "
        end,
        condition = isGit,
        highlight = {colors.black, colors.green},
        separator = " ",
        separator_highlight = {colors.lightBg, colors.lightBg}
    }
}
