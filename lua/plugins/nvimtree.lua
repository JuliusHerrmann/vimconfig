--nvim-tree
vim.api.nvim_set_keymap(
  "n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true }
)
vim.api.nvim_set_keymap(
  "n", '<leader>r', ":NvimTreeRefresh<CR>", { noremap = true }
)
-- nvim_tree
require'nvim-tree'.setup {
}
