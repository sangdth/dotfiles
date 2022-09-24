-- https://github.com/glepnir/galaxyline.nvim
local gl = require("galaxyline")
local gls = gl.section

gl.short_line_list = {""}

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
    else
        label = vim.fn.mode()
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
    if sep == nil then
        sep = "%s"
    end
    local tempTable = {}
    for word in string.gmatch(str, "([^"..sep.."]+)") do
        table.insert(tempTable, word)
    end
    return tempTable
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
local wideEnough = function()
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
    if #text > 40 then
        text = string.sub(text, 1, 40) .. '…'
    end
    return text
end
local FilePath = function()
    local maxWidth = 24
    local path = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')
    if #path > maxWidth then
        local tempTable = split(path, '/')
        -- local firstLast = #tempTable[1] + #tempTable[#tempTable]
        if #tempTable > 2 then
            local tempPath = ''
            for i,v in ipairs(tempTable) do
                if i ~= 1 and i ~= #tempTable then
                    tempPath = tempPath .. string.sub(v, 1, 1) .. '…/'
                else
                    tempPath = tempPath .. v .. '/'
                end
            end
            return tempPath
        end
        return path
    end
    if path == "." then
      return nil
    end
    return path
end

gls.short_line_left[1] = {
  BufferType = {
    provider = FilePath,
    highlight = {colors.white,colors.lightBg},
    separator = " ",
    separator_highlight = {colors.violet,colors.bg},
  }
}

gls.left[1] = {
    ViMode = {
        provider = function()
            local bgColor = mode_highlight()
            highlight('GalaxyViMode', colors.black, bgColor, 'bold')
            highlight('GalaxyViModeInv', bgColor, colors.bg, 'bold')
            return string.format('  %s ', mode_label())
        end,
        condition = canDisplay,
        separator = "",
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
        icon = " ",
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
        provider = FilePath,
        condition = function()
            return is_file() and wideEnough()
        end,
        highlight = { colors.white, colors.bg },
    },
}

-- gls.right[1] = {
--     GitBlame = {
--         provider = function()
--             -- The dict type is here: https://github.com/lewis6991/gitsigns.nvim/blob/main/teal/gitsigns/git.tl#L28
--             local blame = vim.b.gitsigns_blame_line_dict
--             if blame ~= nil then
--                 if blame.author == 'Not Committed Yet' then
--                     if vim.fn.mode() == 'i' then
--                         return ''
--                     else
--                         return 'Not committed yet'
--                     end
--                 else
--                     return blame.author .. ', ' .. auto_trim(blame.summary)
--                     -- .. ', ' .. blame.committer_time // convert to relative time later
--                 end
--             else
--                 return ''
--             end
--         end,
--         condition = isGit,
--         highlight = {colors.white, colors.bg},
--         separator = " ",
--         separator_highlight = {colors.bg, colors.bg},
--     }
-- }

gls.right[1] = {
    GitBranch = {
        provider = function()
            local branchName = require("galaxyline.provider_vcs").get_git_branch() or '!Git'
            local jiraStyle = branchName:match("%a+%-%d+") -- try to get CODE-123 pattern
            if jiraStyle ~= nil then
                branchName = jiraStyle
            end
            local length = 8
            if wideEnough() then
              length = 18
            end
            return  ' ' .. string.sub(branchName, 1, length) -- Make the sub auto detect like responsive(branchName)
        end,
        condition = isGit,
        highlight = {colors.white, colors.lightBg},
        separator = " ",
        separator_highlight = {colors.bg, colors.bg}
    }
}

gls.right[2] = {
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

