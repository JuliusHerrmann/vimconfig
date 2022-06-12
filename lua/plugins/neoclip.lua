-- setup neoclip
require('neoclip').setup({
  default_register = 'plus', -- default register for system copies
})

vim.api.nvim_set_keymap("n", '<leader>co', ":lua require('telescope').extensions.neoclip['plus']()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<leader>c<leader>', ":lua require('telescope').extensions.neoclip['plus']()<CR>", { noremap = true })
