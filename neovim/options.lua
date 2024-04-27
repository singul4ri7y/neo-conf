local options = {
    backup         = false,
    clipboard      = 'unnamedplus',
    completeopt    = { 'menuone', 'noselect' },
    conceallevel   = 0,
    fileencoding   = 'UTF-8',
    hlsearch       = false,
    incsearch      = true,
    ignorecase     = true,
    mouse          = 'a',
    pumheight      = 10,
    showmode       = false,
    showtabline    = 2,
    smartcase      = true,
    smartindent    = true,
    splitbelow     = true,
    splitright     = true,
    swapfile       = false,
    termguicolors  = true,
    timeoutlen     = 200,
    undofile       = true,
    updatetime     = 200,
    writebackup    = false,
    expandtab      = true,
    shiftwidth     = 4,
    tabstop        = 4,
    cursorline     = true,
    number         = true,
    relativenumber = true,
    numberwidth    = 4,
    laststatus     = 3,
    signcolumn     = 'yes',
    wrap           = false,
    linebreak      = true,
    scrolloff      = 8,
    sidescrolloff  = 8,
    whichwrap      = 'bshl<>[]',
    guicursor      = 'n-v-c-i:block',
    virtualedit    = 'onemore'
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Remove the annoying '~'
vim.opt.fillchars:append { eob = ' ' }
