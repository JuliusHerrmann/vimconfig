--keymappings for vim directly
--moving between windows
vim.api.nvim_set_keymap(
  "n", "<C-j>", "<C-W>j", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", "<C-k>", "<C-W>k", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", "<C-l>", "<C-W>l", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", "<C-h>", "<C-W>h", { noremap = true }
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
--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
