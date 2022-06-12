require('packer').startup(function()
  -- use 'morhetz/gruvbox' -- I removed this as the one below should be better
  use 'ellisonleao/gruvbox.nvim' -- colorscheme
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use 'onsails/lspkind.nvim' -- icons for lsp
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'saadparwaiz1/cmp_luasnip' use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- telescope
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- fzf syntax for telescope
  use 'nvim-treesitter/nvim-treesitter' -- treesitter for highlighting
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
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
  use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}} -- tablines
  use 'folke/which-key.nvim'
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
require('plugins/barbar')
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').find_files)
