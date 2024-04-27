local status_ok, bufferline = pcall(require, 'bufferline')

if not status_ok then
    return
end

bufferline.setup {
    options = {
        mode = 'buffers',
        style_preset = {
            bufferline.style_preset.no_bold
        },
        number = 'none',
        close_command = 'Bdelete! %d',
        right_mouse_command = 'Bdelete! %d',
        left_mouse_command = 'buffer %d',
        middle_mouse_command = nil,
        indicator = {
            icon = '▎',
            style = 'icon'
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 30,
        max_prefix_length = 15,
        truncate_names = true,
        -- diagnostics = 'nvim_lsp',
        -- diagnostics_update_in_insert = true,
        -- diagnostics_indicator = function(count, level, _, _)
        --     local icon = ''

        --     if level:match('error') then
        --         icon = '󰛉'
        --     elseif level:match('warn') then
        --         icon = '⚠️'
        --     elseif level:match('hint') then
        --         icon = ''
        --     elseif level:match('info') then
        --         icon = '󰋽'
        --     end

        --     return '[' .. icon .. ' ' .. count .. ']'
        -- end,
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'Finder',
                text_align = 'center',
                highlight = 'Directory',
                separator = true
            }
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        seperator_style = 'thin',
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
        get_element_icon = function(element)
            local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
            if icon then
                icon = icon .. ' '
            end
            return icon, hl
        end
    },
}

vim.cmd.highlight('BufferLineSeparator guifg=#3b3f4f')
vim.cmd.highlight('BufferLineSeparatorVisible guifg=#3b3f4f')
vim.cmd.highlight('BufferLineIndicatorSelected guifg=#3b3f4f')
vim.cmd.highlight('BufferLineIndicatorVisible guifg=#3b3f4f')

vim.cmd.highlight('BufferLineModified guifg=#f5f0e1')
vim.cmd.highlight('BufferLineModifiedSelected guifg=#f5f0e1')
vim.cmd.highlight('BufferLineModifiedVisible guifg=#f5f0e1')
