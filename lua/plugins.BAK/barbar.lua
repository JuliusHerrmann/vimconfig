-- config barbar
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
  diagnostics = {
        {enabled = true}, -- ERROR
        {enabled = false}, -- WARN
        {enabled = false}, -- INFO
        {enabled = true},  -- HINT
    },
    diagnostics_indicator = function(count)
    return "("..count..")"
  end,
}

-- quick buffer jumping with alt key + number
vim.api.nvim_set_keymap("n", '<M-1>', "<Cmd>BufferGoto 1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<M-2>', "<Cmd>BufferGoto 2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<M-3>', "<Cmd>BufferGoto 3<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<M-4>', "<Cmd>BufferGoto 4<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<M-5>', "<Cmd>BufferGoto 5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<M-6>', "<Cmd>BufferGoto 6<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<M-7>', "<Cmd>BufferGoto 7<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<M-8>', "<Cmd>BufferGoto 8<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", '<M-9>', "<Cmd>BufferGoto 9<CR>", { noremap = true })
-- I am not sure about this below :/
vim.api.nvim_set_keymap("n", '<leader>a', "<cmd>BufferPick<CR>", { noremap = true })

-- nvimtree integrations
-- local nvim_tree_events = require('nvim-tree.events')
-- local bufferline_state = require('bufferline.state')

-- nvim_tree_events.on_tree_open(function ()
--   bufferline_state.set_offset(31, "Nvim Tree")
-- end)
--
-- nvim_tree_events.on_tree_close(function ()
--   bufferline_state.set_offset(0)
-- end)
