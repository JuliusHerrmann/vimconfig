-- TODO: formatter
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use 'onsails/lspkind.nvim' -- icons for lsp
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'saadparwaiz1/cmp_luasnip'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- telescope
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- fzf syntax for telescope
  use 'nvim-treesitter/nvim-treesitter' -- treesitter for highlighting
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'morhetz/gruvbox' -- colorscheme
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
-- require('impatient')

-- Set border type
local border_type = "rounded" -- double, rounded, single, shadow, none

-- Enable the following language servers
local servers = {'pyright', 'sumneko_lua', 'texlab', 'jdtls'}

-- vim whichkey PLEASE UPDATE ACCORDING TO NEW MAPPINGS
local wk = require'which-key'
wk.register({
  e = "show diagnostic",
  c ={
    name = "copy options",
    o = "show copy history",
    ["<space>"] = "show copy history",
    a = "lsp code actions"
  },
  ["?"] = "telescope oldfiles",
  ["<space>"] = "telescope files",
  b = "telescope buffers",
  D = "lsp type definitions",
  q = "diagnostic loclist",
  rn = "lsp rename",
  s = {
    name = "telescope actions",
    o = "document symbols",
    b = "buffer fuzzy search",
    sp = "live grep in project",
  },
  w = {
    name = "lsp workspace",
    a = "add workspace folder",
    l = "list workspace folders",
    r = "remove workspace folder",
  },
  a = "Buffer Pick"
}, {prefix = "<leader>"})
wk.setup({
  window = {
    border = "none"
  }
})

-- default vim settings
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.opt.undofile = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.wo.relativenumber = true
vim.opt.smartindent = true
vim.opt.hidden = true
vim.opt.showmode = false

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox]]
vim.highlight.create('Comment', {cterm='italic', gui='italic'}, false)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

--Remaps
--moving between windows
vim.api.nvim_set_keymap(
  "n", "<C-J>", "<C-W>j", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", "<C-K>", "<C-W>k", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", "<C-L>", "<C-W>l", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", "<C-H>", "<C-W>h", { noremap = true }
)
--window resizing
vim.api.nvim_set_keymap(
  "n", "<M-j>", ":resize -2<CR>", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", "<M-k>", ":resize +2<CR>", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", "<M-h>", ":vertical resize -2<CR>", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", "<M-l>", ":vertical resize +2<CR>", { noremap = true }
)

--block tabbing
vim.api.nvim_set_keymap(
  "v", "<", "<gv", { noremap = true}
)
vim.api.nvim_set_keymap(
  "v", ">", ">gv", { noremap = true}
)

--Clear search highlight by double tapping escape @Oli
vim.api.nvim_set_keymap(
  "n", "<esc><esc>", ":noh<return><esc>", { noremap = true }
)

--nvim-tree
vim.api.nvim_set_keymap(
  "n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", '<leader>r', ":NvimTreeRefresh<CR>", { noremap = true }
)


--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
  vim.api.nvim_buf_create_user_command(bufnr, "Format", vim.lsp.buf.formatting, {})
end


-- LSP settings
local lspconfig = require 'lspconfig'

-- gutter icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})


-- show error in floating window
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- show error in floating window only when hovering over error
-- vim.api.nvim_create_autocmd("CursorHold", {
--   buffer = bufnr,
--   callback = function()
--     local opts = {
--       focusable = false,
--       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--       border = border_type, -- double, rounded, single, shadow, none
--       source = 'always',
--       prefix = ' ',
--       scope = 'cursor',
--     }
--     vim.diagnostic.open_float(nil, opts)
--   end
-- })


-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable language servers defined in servers
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
-- custom setup for lua
-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
-- luasnip setup
local luasnip = require 'luasnip'


-- nvim-cmp setup

local function border(hl_name)
   return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
   }
end

local cmp = require 'cmp'
local lspkind = require('lspkind')
cmp.setup ({
  window = {
    completion = {
      border = border "CmpBorder",
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
    documentation = {
      border = border "CmpDocBorder",
    },
  },
  formatting = {
    format = lspkind.cmp_format(),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})

-- Telescope
local actions = require("telescope.actions")
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<esc>"] = actions.close
      },
    },
    border = {},
    -- prompt_prefix = "   ",
    prompt_prefix = " 🔭 ",
    selection_caret = "  ",
    entry_prefix = "  ",
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    winblend = 0,
  },
  extensions_list = { "themes", "terms" },
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

--Add leader shortcuts
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers)
-- vim.keymap.set('n', '<leader>sf', function()
--   require('telescope.builtin').find_files { previewer = false }
-- end)
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
--[[ vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string) ]]
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>so', function()
  require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)

-- neoclip
vim.api.nvim_set_keymap("n", '<leader>co', ":lua require('telescope').extensions.neoclip['plus']()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<leader>c<leader>', ":lua require('telescope').extensions.neoclip['plus']()<CR>", { noremap = true })

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

--Set statusbar
local gps = require("nvim-gps")
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
    }
  }
}

-- nvim_tree
require'nvim-tree'.setup {
}

-- setup commenter
require('Comment').setup()

-- setup hop
vim.api.nvim_set_keymap('n', 's', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.BEGIN })<cr>", {})
vim.api.nvim_set_keymap('v', 's', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.BEGIN })<cr>", {})
vim.api.nvim_set_keymap('o', 's', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.BEGIN, inclusive_jump = true })<cr>", {})

-- setup lsp_signature
require'lsp_signature'.setup({
  bind = true,
  hint_prefix = "🐼 ",
  handler_opts = {
    border = border_type
  }
})

-- nvim color setup
require'colorizer'.setup()

-- setup hop
require'hop'.setup()

-- setup nvim-gps
require("nvim-gps").setup({
  separator = ' > ',
})

-- setup neoclip
require('neoclip').setup({
  default_register = 'plus',
})

-- config tablines
require'bufferline'.setup {
  -- Enable/disable animations
  animation = false,
  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,
  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,
  -- Enable/disable close button
  closable = false,
  clickable = true,
  -- Excludes buffers from the tabline
  exclude_ft = {},
  exclude_name = {},
  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  diagnostics = "nvim_lsp",
  diagnostics_indicator = function(count)
    return "("..count..")"
  end,
}

-- quick buffer jumping with alt key + number
vim.api.nvim_set_keymap("n", '<silent><M-1>', "<Cmd>BufferGoto 1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<silent><M-2>', "<Cmd>BufferGoto 2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<silent><M-3>', "<Cmd>BufferGoto 3<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<silent><M-4>', "<Cmd>BufferGoto 4<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<silent><M-5>', "<Cmd>BufferGoto 5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<silent><M-6>', "<Cmd>BufferGoto 6<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<silent><M-7>', "<Cmd>BufferGoto 7<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<silent><M-8>', "<Cmd>BufferGoto 8<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<silent><M-9>', "<Cmd>BufferGoto 9<CR>", { noremap = true })
-- I am not sure about this below :/
vim.api.nvim_set_keymap("n", '<leader>a', "<cmd>BufferPick<CR>", { noremap = true }) 
