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
            return '       '
        elseif str == 'INSERT' then
            return '      '
        elseif str == 'COMMAND' then
            return '       '
        elseif str == 'VISUAL' then
            return '   󰕷    '
        elseif str == 'V-LINE' then
            return '   󰉸    '
        elseif str == 'V-BLOCK' then
            return '   󱊈    '
        elseif str == 'TERMINAL' then
            return '       '
        end

        return str
    end
}

local statusline_accent = '#448ee4'

local branch = {
    'branch',
    icons_enabled = true,
    icon = '',
}

local diagnostics = {
    'diagnostics',
	sources = { 'nvim_diagnostic' },
	sections = { 'error', 'warn' },
	symbols = { error = ' ', warn = ' ' },
	colored = false,
	update_in_insert = true,
	always_visible = true,
}

local diff = {
    'diff',
    colored = true,
    symbols = {
        added = '',
        modified = '●',
        removed = ''
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

    return devicons.get_icon_by_filetype(ft) .. ' ' .. ft:upper()
end

local function encoding()
    return vim.opt.fileencoding:get():upper()
end

local function linux()
    return 'ArchLinux'
end

-- Make some changes to lualine theme.

local common = {
    a = { bg = '#6e8ca0', fg = '#f7f3ea', gui = 'bold' },
    b = { bg = statusline_accent, gui = 'italic' },
    c = { bg = statusline_accent, gui = 'bold,italic' },
    x = { bg = statusline_accent, gui = 'none' },
    y = { bg = statusline_accent, gui = 'bold,italic' },
    z = { bg = statusline_accent, gui = 'none' }
}

local colorscheme = {
    normal = {
        a = { bg = '#7fae56', fg = '#f7f3ea', gui = 'bold' },
        b = { bg = statusline_accent, gui = 'italic' },
        c = { bg = statusline_accent, gui = 'bold,italic' },
        x = { bg = statusline_accent, gui = 'none' },
        y = { bg = statusline_accent, gui = 'bold,italic' },
        z = { bg = statusline_accent, gui = 'none' }
    },
    insert = {
        a = { bg = '#d96d6d', fg = '#f7f3ea', gui = 'bold' },
        b = { bg = statusline_accent, gui = 'italic' },
        c = { bg = statusline_accent, gui = 'bold,italic' },
        x = { bg = statusline_accent, gui = 'none' },
        y = { bg = statusline_accent, gui = 'bold,italic' },
        z = { bg = statusline_accent, gui = 'none' }
    },
    visual = {
        a = { bg = '#c7b964', fg = '#f7f3ea', gui = 'bold' },
        b = { bg = statusline_accent, gui = 'italic' },
        c = { bg = statusline_accent, gui = 'bold,italic' },
        x = { bg = statusline_accent, gui = 'none' },
        y = { bg = statusline_accent, gui = 'bold,italic' },
        z = { bg = statusline_accent, gui = 'none' }
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
        lualine_b = { diagnostics },
        lualine_c = { branch },

        lualine_x = { diff, get_line, encoding, fileformat },
        lualine_y = { filetype },
        lualine_z = { linux }
    }
}
