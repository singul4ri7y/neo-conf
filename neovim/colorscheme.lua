local status_ok, ayu = pcall(require, 'ayu')

if not status_ok then
    return
end

ayu.setup {
    overrides = {
        Normal = { bg = 'None' },
        ColorColumn = { bg = 'none' },
        SignColumn = { bg = 'None' },
        Folded = { bg = 'None' },
        FoldColumn = { bg = 'None' },
        CursorLine = { bg = '#2c3036' },
        LineNr = { fg = '#484f58' },
        CursorLineNr = { bg = 'none' },
        CursorColumn = { bg = 'None' },
        WhichKeyFloat = { bg = 'None' },
        VertSplit = { fg = '#3b3f4f', bg = 'none' },
    }
}

vim.cmd.colorscheme('ayu-dark')

-- Transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
