local status_ok, gs = pcall(require, 'gitsigns')

if not status_ok then
    return
end

local function on_attach(bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', '<leader>hj', gs.prev_hunk, opts)
    vim.keymap.set('n', '<leader>hk', gs.next_hunk, opts)
    vim.keymap.set('n', '<leader>hS', gs.stage_hunk)
    vim.keymap.set('n', '<leader>hR', gs.reset_hunk)
    vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    vim.keymap.set('n', '<leader>hs', gs.stage_buffer)
    vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk)
    vim.keymap.set('n', '<leader>hr', gs.reset_buffer)
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
    vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end)
    vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame)
    vim.keymap.set('n', '<leader>hd', gs.diffthis)
    vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end)
    vim.keymap.set('n', '<leader>td', gs.toggle_deleted)
end

gs.setup {
    on_attach = on_attach
}
