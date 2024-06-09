local ll_status_ok, lualine = pcall(require, 'lualine')

if not ll_status_ok then
    return
end

local dev_status_ok, devicons = pcall(require, 'nvim-web-devicons')

if not dev_status_ok then
    return
end

local mode = {
    'mode',
    fmt = function(str)
        if str == 'NORMAL' then
            return '│         │'
        elseif str == 'INSERT' then
            return '│        │'
        elseif str == 'COMMAND' then
            return '│        │'
        elseif str == 'VISUAL' then
            return '│    󰕷     │'
        elseif str == 'V-LINE' then
            return '│    󰉸     │'
        elseif str == 'V-BLOCK' then
            return '│    󱊈    │'
        elseif str == 'TERMINAL' then
            return '│        │'
        end

        return str
    end
}

local branch = {
    'branch',
    icons_enabled = true,
    icon = '',
}

-- local diagnostics = {
--     'diagnostics',
-- 	sources = { 'nvim_diagnostic' },
-- 	sections = { 'error', 'warn' },
-- 	symbols = { error = ' ', warn = ' ' },
-- 	colored = false,
-- 	update_in_insert = true,
-- 	always_visible = true,
-- }

local diff = {
    'diff',
    colored = true,
    symbols = {
        added = '󰝒 ',
        modified = ' ',
        removed = '󱪡 '
    },
    diff_color = {
        added = { fg = '#70ad63' },
        removed = { fg = '#d27777' },
        modified = { fg = '#e0d181' }
    }
}

local function get_line()
    local cursor = vim.api.nvim_win_get_cursor(0)

    local current_line = vim.fn.line '.'
    local total_lines = vim.fn.line '$'

    return 'Ln ' .. cursor[1] .. ', Col ' .. cursor[2] .. ' (' .. string.format('%.0f', current_line / total_lines * 100) .. '%%)'
end

local fileformat = {
    'fileformat',
    symbols = {
        unix = '󰣇 ',
        mac = '󰀵 ',
        dos = '󰖳 '
    }
}

local function filetype()
    local ft = vim.bo.filetype

    return devicons.get_icon_by_filetype(ft) .. '  ' .. ft:upper()
end

local function encoding()
    return vim.opt.fileencoding:get():upper()
end

local function linux()
    return 'ArchLinux'
end

-- Make some changes to lualine theme
local common = {
    a = { bg = nil, gui = 'bold' },
    b = { bg = nil, gui = 'italic' },
    c = { bg = nil, gui = 'bold,italic' },
    x = { bg = nil, gui = 'none' },
    y = { bg = nil, gui = 'bold,italic' },
    z = { bg = nil, gui = 'none' }
}

local colorscheme = {
    normal = {
        a = { bg = nil, fg = '#7fae56', gui = 'bold' },
        b = { bg = nil, fg = '#7fae56', gui = 'italic' },
        c = { bg = nil, fg = '#7fae56', gui = 'bold,italic' },
        x = { bg = nil, fg = '#7fae56', gui = 'none' },
        y = { bg = nil, fg = '#7fae56', gui = 'bold,italic' },
        z = { bg = nil, fg = '#7fae56', gui = 'none' }
    },
    insert = {
        a = { bg = nil, fg = '#d96d6d', gui = 'bold' },
        b = { bg = nil, fg = '#d96d6d', gui = 'italic' },
        c = { bg = nil, fg = '#d96d6d', gui = 'bold,italic' },
        x = { bg = nil, fg = '#d96d6d', gui = 'none' },
        y = { bg = nil, fg = '#d96d6d', gui = 'bold,italic' },
        z = { bg = nil, fg = '#d96d6d', gui = 'none' }
    },
    visual = {
        a = { bg = nil, fg = '#c7b964', gui = 'bold' },
        b = { bg = nil, fg = '#c7b964', gui = 'italic' },
        c = { bg = nil, fg = '#c7b964', gui = 'bold,italic' },
        x = { bg = nil, fg = '#c7b964', gui = 'none' },
        y = { bg = nil, fg = '#c7b964', gui = 'bold,italic' },
        z = { bg = nil, fg = '#c7b964', gui = 'none' }
    },
    command = common,
    terminal = common
}

lualine.setup {
    options = {
        icon_enabled = true,
        theme = colorscheme,
        globalstatus = true,
        component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { 'alpha', 'dashboard', 'Outline' },
        always_divide_middle = true
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = {},

        lualine_x = { diff, get_line, encoding, fileformat },
        lualine_y = { filetype },
        lualine_z = { linux }
    }
}
