--Set lualine

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
        'navic',
        'lsp_progress'
    }
  }
}
