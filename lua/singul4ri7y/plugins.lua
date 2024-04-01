local fn = vim.fn

-- Automatically install packer if it's not installed.

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    -- Packer is not installed. Install it.

    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    }

    print('Installing Packer. Please close and reopen Neovim.')

    vim.cmd 'packadd packer.nvim'
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file.

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use.

local status_ok, packer = pcall(require, 'packer')

if not status_ok then
    return
end

-- Have packer use a popup window.

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

-- Plugins here.

return packer.startup(function(use)
    -- Packer to manage itself.

    use 'wbthomason/packer.nvim'

    -- Colorscheme.

    use 'Shatur/neovim-ayu'

    -- Colorizer.

    use 'norcalli/nvim-colorizer.lua'

    -- Treesitter.

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'

    -- Lualine as statusline.

    use 'nvim-lualine/lualine.nvim'

    -- Completion engine.

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'

    -- Snippet engine.

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- LSP.

    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Indent line.

    use 'lukas-reineke/indent-blankline.nvim'

    -- Bufferline.

    use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' }

    -- Nvim Tree.

    use 'nvim-tree/nvim-tree.lua'

    -- BufDelete.nvim

    use 'famiu/bufdelete.nvim'

    -- Telescope.

    use { 'nvim-telescope/telescope.nvim', tag = '0.1.5', requires = 'nvim-lua/plenary.nvim' }
    use 'airblade/vim-rooter'

    -- Git.

    use 'lewis6991/gitsigns.nvim'

    -- Toggleterm.

    use 'akinsho/toggleterm.nvim'

    if PACKER_BOOTSTRAP then
        require('packer').sync();
    end
end)
