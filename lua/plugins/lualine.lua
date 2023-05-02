--Set lualine
local gps = require("nvim-gps")
require('lualine').setup {
  options = {
    icons_enabled = true,
    -- theme = 'gruvbox',
    -- theme = 'rose-pine',
    theme = 'catppuccin',
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
      'lsp_progress'
    }
  }
}
