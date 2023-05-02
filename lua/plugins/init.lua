require('packer').startup(function()
  -- colorschemes
  use 'ellisonleao/gruvbox.nvim'
  use 'rose-pine/neovim'
  use 'mangeshrex/everblush.vim'
  use 'marko-cerovac/material.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- other plugins
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use 'williamboman/nvim-lsp-installer' -- Language server auto install
  use 'onsails/lspkind.nvim' -- icons for lsp
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- lsp source for cmp
  use 'hrsh7th/cmp-path' -- path source for cmp
  use 'hrsh7th/cmp-buffer' -- path source for cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'saadparwaiz1/cmp_luasnip'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- telescope
  -- use 'hrsh7th/vim-vsnip'
  -- use 'hrsh7th/vim-vsnip-integ'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- fzf syntax for telescope
  use 'nvim-treesitter/nvim-treesitter' -- treesitter for highlighting
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {'kyazdani42/nvim-web-devicons'}
  use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use 'arkav/lualine-lsp-progress' -- lsp integration with lualine
  use {'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use 'jiangmiao/auto-pairs' -- automatically close pairs
  use "tpope/vim-surround" -- better handle surrounds
  use 'numToStr/Comment.nvim' -- auto comments
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use 'KabbAmine/zeavim.vim' -- zeal integration
  use 'phaazon/hop.nvim' -- easy jumping
  use 'ray-x/lsp_signature.nvim' -- show signatures for functions
  use 'norcalli/nvim-colorizer.lua' -- color hexcodes
  use 'lewis6991/impatient.nvim' -- cache plugins for better startup
  use {"SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter"} -- show position in lualine
  use 'AckslD/nvim-neoclip.lua' -- clipboard history
  -- use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}} -- tablines
  use 'nanozuki/tabby.nvim'
  use 'folke/which-key.nvim' -- show help for keymappings
  use 'lewis6991/gitsigns.nvim' -- nice git integration
  use 'sbdchd/neoformat'
  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  end)
-- this needs to be at the start
_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_modpaths',
  }
}

-- we need to initiate this here
require('impatient')

-- load all other plugins
-- comment out to disable
require('plugins/lsp')
require('plugins/lsp-installer') -- this needs to execute after lsp!
require('plugins/whichkey')
require('plugins/nvimtree')
require('plugins/luasnip')
require('plugins/cmp')
require('plugins/telescope')
require('plugins/neoclip')
require('plugins/treesitter')
require('plugins/gps')
require('plugins/lualine')
require('plugins/commenter')
require('plugins/hop')
require('plugins/lsp_signature')
require('plugins/colorizer')
-- require('plugins/barbar')
require('plugins/tabby')
-- require('plugins/rose-pine')
require('plugins/catppuccin')
require('plugins/gitsigns')
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').find_files)
