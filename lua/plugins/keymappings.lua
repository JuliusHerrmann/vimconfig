--keymappings for vim directly
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
--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })