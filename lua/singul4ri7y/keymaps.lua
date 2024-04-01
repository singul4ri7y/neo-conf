local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name.

local keymap = vim.keymap.set

-- Remap space as leader key.

keymap('', '<Space>', '<Nop>', opts)

vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

-- Modes

local normal_mode = 'n'
local insert_mode = 'i'
local visual_mode = 'v'
local vb_mode     = 'x'

-- Normal Mode --

-- Better window navigation.

keymap(normal_mode, '<C-h>', '<C-w>h', opts)
keymap(normal_mode, '<C-j>', '<C-w>j', opts)
keymap(normal_mode, '<C-k>', '<C-w>k', opts)
keymap(normal_mode, '<C-l>', '<C-w>l', opts)

-- Resize with arrows.

keymap(normal_mode, '<C-Up>', ':resize -2<CR>', opts)
keymap(normal_mode, '<C-Down>', ':resize +2<CR>', opts)
keymap(normal_mode, '<C-Left>', ':vertical resize -2<CR>', opts)
keymap(normal_mode, '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers.

keymap(normal_mode, '<S-l>', ':BufferLineCycleNext<CR>', opts)
keymap(normal_mode, '<S-h>', ':BufferLineCyclePrev<CR>', opts)
keymap(normal_mode, '<S-q>', ':BufferLineCloseOthers<CR>', opts)

-- Move text up and down.

keymap(normal_mode, '<A-j>', ':m .+1<CR>==', opts)
keymap(normal_mode, '<A-k>', ':m .-2<CR>==', opts)

-- Remap redo.

keymap(normal_mode, '<C-u>', '<C-r>', opts)

-- Go to the end/beginning of the line.

keymap(normal_mode, '<A-h>', '^', opts)
keymap(normal_mode, '<A-l>', '$', opts)

-- Nvim Tree.

keymap(normal_mode, '<C-e>', ':NvimTreeToggle<CR>', opts)

-- Delete current buffer.

keymap(normal_mode, '<C-b>', ':Bdelete<cr>', opts)

-- Telescope.

local status_ok, ts_builtin = pcall(require, 'telescope.builtin')

if not status_ok then
    return
end

local function ts_wrapper(property)
    return function()
        local dir = vim.loop.cwd()

        ts_builtin[property] {
            cwd = dir
        }

        -- Now change back to current directory.

        vim.cmd('cd ' .. dir)
    end
end

keymap(normal_mode, '<C-f>', ts_wrapper('find_files'), opts)
keymap(normal_mode, '<C-g>', ts_wrapper('live_grep'), opts)
keymap(normal_mode, 'gr', ts_wrapper('lsp_references'), opts)
keymap(normal_mode, 'gs', ts_wrapper('lsp_document_symbols'), opts)
keymap(normal_mode, 'gw', ts_wrapper('lsp_workspace_symbols'), opts)

-- Telescope git.

keymap(normal_mode, '<leader>gb', ':Telescope git_branches<CR>', opts)
keymap(normal_mode, '<leader>gf', ':Telescope git_files<CR>', opts)
keymap(normal_mode, '<leader>gs', ':Telescope git_status<CR>', opts)
keymap(normal_mode, '<leader>gc', ':Telescope git_commits<CR>', opts)
keymap(normal_mode, '<leader>gc', ':Telescope git_bcommits<CR>', opts)

-- Save buffer.

keymap(normal_mode, '<leader>w', ':write<CR>', opts)
keymap(normal_mode, '<leader>q', ':q<CR>', opts)

-- Terminal.

keymap(normal_mode, '<leader>git', ':lua _LAZYGIT_TOGGLE()<CR>', opts)
keymap(normal_mode, '<leader>node', ':lua _NODE_TOGGLE()<CR>', opts)
keymap(normal_mode, '<leader>py', ':lua _PY_TOGGLE()<CR>', opts)
keymap(normal_mode, '<leader>pro', ':lua _PR_TOGGLE()<CR>', opts)

-- Insert Mode --

-- Get out of insert mode.

keymap(insert_mode, 'jk', '<ESC>', opts)
keymap(insert_mode, 'kj', '<ESC>', opts)

-- Alt + Backspace to delete a word.

keymap(insert_mode, '<A-BS>', '<C-w>', opts)

-- Navigate cursor to the next/previous word.

keymap(insert_mode, '<C-h>', '<C-o>b', opts)
keymap(insert_mode, '<C-l>', '<C-o>e<C-o>l', opts)

-- Go to the beginning/end of the line.

keymap(insert_mode, '<A-h>', '<C-o>^', opts)
keymap(insert_mode, '<A-l>', '<C-o>$<C-o>l', opts)

-- Undo and redo keymaps.

keymap(insert_mode, '<C-u>', '<C-o>u', opts)
keymap(insert_mode, '<C-A-u>', '<C-o><C-r>', opts)

-- Nvim Tree.

keymap(insert_mode, '<C-e>', '<C-o>:NvimTreeToggle', opts)

-- Pasting.

keymap(insert_mode, '<C-p>', '<C-o>p', opts)

-- Visual Mode --

-- Stay in indent mode.

keymap(visual_mode, '<', '<gv^', opts)
keymap(visual_mode, '>', '>gv^', opts)

-- Move text up and down.

keymap(visual_mode, '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap(visual_mode, '<A-k>', ":m '<-2<CR>gv=gv", opts)
keymap(visual_mode, 'p', '"_dP', opts)

-- Visual Block Mode --

-- Move text up and down.

keymap(vb_mode, 'J', ":m '>+1<CR>gv=gv", opts)
keymap(vb_mode, 'K', ":m '<-2<CR>gv=gv", opts)
keymap(vb_mode, '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap(vb_mode, '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Go to the end/beginning of the line.

keymap(vb_mode, '<A-h>', '^', opts)
keymap(vb_mode, '<A-l>', '$', opts)

