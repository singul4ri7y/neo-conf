local status_ok, nvim_tree = pcall(require, 'nvim-tree')

if not status_ok then
    return
end

local function on_attach(bufnr)
    local api = require 'nvim-tree.api'

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Default mappings.

    api.config.mappings.default_on_attach(bufnr)

    -- Custom mappings.

    vim.keymap.set('n', '<C-e>', api.tree.toggle,                opts 'Toggle Tree')
    vim.keymap.set('n', '>',     api.tree.change_root_to_node,   opts 'Change Root')
    vim.keymap.set('n', '<',     api.tree.change_root_to_parent, opts 'Up')
    vim.keymap.set('n', '?',     api.tree.toggle_help,           opts 'Help')
end

nvim_tree.setup {
    on_attach = on_attach,
    hijack_cursor = true,
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    renderer = {
        add_trailing = false,
        group_empty = false,
        full_name = false,
        root_folder_label = function(path)
            return '  ' .. vim.fn.fnamemodify(path, ':t')
        end,
        indent_width = 2,
        special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
        symlink_destination = true,
        highlight_git = true,
        highlight_diagnostics = true,
        highlight_opened_files = 'icon',
        highlight_modified = 'icon',
        highlight_bookmarks = 'icon',
        highlight_clipboard = 'icon',
        indent_markers = {
            enable = true,
            inline_arrows = true,
                icons = {
                corner = '└',
                edge = '│',
                item = '│',
                bottom = '─',
                none = ' ',
            },
        },
        icons = {
            web_devicons = {
                file = {
                    enable = true,
                    color = true,
                },
                folder = {
                    enable = true,
                    color = true,
                }
            },
            git_placement = 'signcolumn',
            modified_placement = 'after',
            diagnostics_placement = 'signcolumn',
            bookmarks_placement = 'before',
            padding = ' ',
            symlink_arrow = ' 󰑃  ',
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
                diagnostics = true,
                bookmarks = true,
            },
            glyphs = {
                default = '',
                symlink = '',
                bookmark = '',
                modified = '●',
                folder = {
                    arrow_closed = '',
                    arrow_open = '',
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                    symlink_open = '',
                },
                git = {
                    unstaged = '',
                    staged = '',
                    unmerged = '',
                    renamed = '',
                    untracked = '',
                    deleted = '󰱢',
                    ignored = '',
                },
            }
        }
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR
        },
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = ''
        }
    },
    modified = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = false
    },
    git = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = false,
        timeout = 400
    }
}

-- Colorscheme.

local folder = '#7ca3c1'

-- Files --

vim.cmd.highlight('NvimTreeOpenedFile guifg=#ff6347')
vim.cmd.highlight('NvimTreeModifiedFile guifg=#f5f0e1')

-- Folder --

vim.cmd.highlight('Directory guifg='.. folder)
vim.cmd.highlight('NvimTreeFolderName guifg=' .. folder)
vim.cmd.highlight('NvimTreeOpenedFolderName guifg=' .. folder)
vim.cmd.highlight('NvimTreeEmptyFolderName guifg=' .. folder)
vim.cmd.highlight('NvimTreeSymlinkFolderName guifg=#c383aa')
vim.cmd.highlight('NvimTreeRootFolder guifg=#7fae56')

-- Icons --

vim.cmd.highlight('NvimTreeFolderIcon guifg=' .. folder)

-- Indent --

vim.cmd.highlight('NvimTreeIndentMarker guifg=#3b3f4f')

-- Git --

vim.cmd.highlight('NvimTreeGitDirty guifg=#d18abe')
vim.cmd.highlight('NvimTreeGitStaged guifg=#9ed670')
vim.cmd.highlight('NvimTreeGitNew guifg=#e39b5d')
vim.cmd.highlight('NvimTreeGitDeleted guifg=#ff9999')
vim.cmd.highlight('NvimTreeGitRenamed guifg=#4b8bbe')
