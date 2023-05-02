-- we have to start with this
vim.o.termguicolors = true

-- load keymappings
require("plugins/keymappings")
-- load plugins
require("plugins")


--Set colorscheme
vim.opt.background = "dark"
-- vim.cmd.colorscheme "catppuccin"
-- vim.cmd([[colorscheme rose-pine]])
-- vim.g.material_style = "darker"
-- vim.cmd([[colorscheme material]])
-- vim.cmd([[colorscheme gruvbox]])

-- default vim settings
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.opt.undofile = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
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

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Only one status line at the bottom
vim.opt.laststatus = 3


-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
