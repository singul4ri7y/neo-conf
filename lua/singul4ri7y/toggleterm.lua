local toggleterm_status_ok, toggleterm = pcall(require, 'toggleterm')

if not toggleterm_status_ok then
    return
end

local terminal_status_ok, terminal = pcall(require, 'toggleterm.terminal')

if not terminal_status_ok then
    return
end

toggleterm.setup {
    direction = 'tab',
    open_mapping = '<C-t>',
    shell = vim.o.shell,
    float_opts = {
        border = 'curved',
        highlights = {
            border = 'Normal',
            background = 'Normal'
        }
    }
}

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
