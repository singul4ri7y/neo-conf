local status_ok, telescope = pcall(require, 'telescope')

if not status_ok then
    return
end

telescope.setup {
    defaults = {
        prompt_prefix = '󰭎  ',
        selection_caret = ' ',
        path_display = { 'smart' },

        mappings = {
            i = {
                ['<C-j>'] = 'move_selection_next',
                ['<C-k>'] = 'move_selection_previous',
                ['<A-j>'] = 'move_to_bottom',
                ['<A-k>'] = 'move_to_top',
                ['<S-k>'] = 'preview_scrolling_up',
                ['<S-j>'] = 'preview_scrolling_down',
            },
            n = {
                ['<C-j>'] = 'preview_scrolling_down',
                ['<C-k>'] = 'preview_scrolling_up',
                ['<C-c>'] = 'close'
            }
        }
    }
}
