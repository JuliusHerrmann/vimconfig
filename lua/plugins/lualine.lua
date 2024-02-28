--Set lualine

require('lualine').setup {
  options = {
    icons_enabled = true,
    -- theme = 'gruvbox',
    -- theme = 'rose-pine',
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = { left = "", right = ""},
  },
  sections = {
    lualine_c = {
        'filename',
        'navic',
        'lsp_progress'
    }
  },
  tabline = {
      lualine_a = {'buffers'},
      lualine_z = {'tabs'}
  }
}
