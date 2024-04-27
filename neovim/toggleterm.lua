local toggleterm_status_ok, toggleterm = pcall(require, 'toggleterm')

if not toggleterm_status_ok then
    return
end

local terminal_status_ok, terminal = pcall(require, 'toggleterm.terminal')

if not terminal_status_ok then
    return
end

toggleterm.setup {
    direction = 'horizontal',
    open_mapping = '<C-t>',
    shell = vim.o.shell,
    float_opts = {
        highlights = {
            border = 'Normal',
            background = 'Normal'
        }
    }
}

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>',    [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk',       [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'kj',       [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<A-BS>',   [[<C-\><C-W>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-Up>',   [[<C-\><C-n>:resize +1<CR>i]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-Down>', [[<C-\><C-n>:resize -1<CR>i]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = terminal.Terminal

local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }
local node    = Terminal:new { cmd = 'node', hidden = true }
local python  = Terminal:new { cmd = 'python', hidden = true }
local promit  = Terminal:new { cmd = 'promit', hidden = true }

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

function _NODE_TOGGLE()
    node:toggle()
end

function _PY_TOGGLE()
    python:toggle()
end

function _PR_TOGGLE()
    promit:toggle()
end
