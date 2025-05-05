local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not (vim.uv or vim.loop).fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            "--depth=1",
            "--filter=blob:none",
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end

    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add {
    -- LSP Support
    'neovim/nvim-lspconfig',
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    -- Snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'olimorris/onedarkpro.nvim',
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    },
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope-file-browser.nvim',
    'tpope/vim-fugitive',
    'akinsho/toggleterm.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'akinsho/bufferline.nvim',
    'jose-elias-alvarez/null-ls.nvim',
}
