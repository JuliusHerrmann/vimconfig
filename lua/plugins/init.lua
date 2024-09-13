require("lazy").setup({
    -- colorschemes
    {'ellisonleao/gruvbox.nvim', lazy = true},
    {'rose-pine/neovim', lazy = true},
    {'mangeshrex/everblush.vim', lazy = true},
    {'marko-cerovac/material.nvim', lazy = true},
    { 'catppuccin/nvim', lazy = true, name = 'catppuccin' },

    -- other plugins
    'neovim/nvim-lspconfig', -- Collection of configurations for the built-in LSP client
    'williamboman/nvim-lsp-installer', -- Language server auto install
    'onsails/lspkind.nvim', -- icons for lsp
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp', -- lsp source for cmp
    'hrsh7th/cmp-path', -- path source for cmp
    'hrsh7th/cmp-buffer', -- path source for cmp
    'L3MON4D3/LuaSnip', -- Snippets plugin
    'saadparwaiz1/cmp_luasnip', -- cmp source for snippets
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } }, -- telescope
    -- 'hrsh7th/vim-vsnip'
    -- 'hrsh7th/vim-vsnip-integ'
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    'nvim-treesitter/nvim-treesitter', -- treesitter for highlighting
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-treesitter-context', -- function context
    'RRethy/nvim-treesitter-textsubjects', -- treesitter . and ; textobjects
    'nvim-tree/nvim-web-devicons',
    {'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }},
    'arkav/lualine-lsp-progress', -- lsp integration with lualine
    {'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }},
    'tpope/vim-surround', -- better handle surrounds
    {'windwp/nvim-autopairs', event = 'InsertEnter'}, -- auto pairs
    'numToStr/Comment.nvim', -- auto comments
    'ludovicchabant/vim-gutentags', -- Automatic tags management
    'KabbAmine/zeavim.vim', -- zeal integration
    'phaazon/hop.nvim', -- easy jumping
    -- 'ray-x/lsp_signature.nvim', -- show signatures for functions
    'norcalli/nvim-colorizer.lua', -- color hexcodes
    'AckslD/nvim-neoclip.lua', -- clipboard history
    -- 'nanozuki/tabby.nvim', -- tabline
    -- { 'alvarosevilla95/luatab.nvim', dependencies='kyazdani42/nvim-web-devicons' }, -- tabline
    'folke/which-key.nvim', -- show help for keymappings
    'lewis6991/gitsigns.nvim', -- nice git integration
    {'SmiteshP/nvim-navic', dependencies = 'neovim/nvim-lspconfig'}, -- code location
    {'sbdchd/neoformat',
        init = function ()
            vim.g.latexindent_opt="-m"
        end
    }, -- formatter
    -- Markdown previews
    {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- better references / definitions and problems
    {'folke/trouble.nvim', dependencies = 'nvim-tree/nvim-web-devicons'},
    -- Rainbow brackets
    -- {'HiPhish/nvim-ts-rainbow2', dependencies = 'nvim-treesitter/nvim-treesitter'},
    -- function tree
   'stevearc/aerial.nvim',
   'github/copilot.vim', --Copilot
   'vidocqh/auto-indent.nvim', -- autoindent
   -- 'https://codeberg.org/esensar/nvim-dev-container', -- devcontainers
   {'lervag/vimtex',
        init = function ()
            require('plugins/vimtex')
        end
   }
})

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
require('plugins/treesitter-context')
require('plugins/lualine')
require('plugins/commenter')
require('plugins/hop')
-- require('plugins/lsp_signature')
require('plugins/colorizer')
-- require('plugins/barbar')
-- require('plugins/tabby')
-- require('plugins/luatab')
-- require('plugins/rose-pine')
require('plugins/catppuccin')
require('plugins/gitsigns')
require('plugins/navic')
require('plugins/trouble')
-- require('plugins/rainbow')
require('plugins/aerial')
require('plugins/autoindent')
require('plugins/nvim-autopairs')
-- require('plugins/devcontainers')
