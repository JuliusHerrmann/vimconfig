-- setup lsp_signature
require'lsp_signature'.setup({
  bind = true,
  hint_prefix = "🐼 ",
  handler_opts = {
    border = "rounded" -- double, rounded, single, shadow, none
  }
})
