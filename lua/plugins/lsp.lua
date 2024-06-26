-- -- Enable the following language servers
-- local servers = {'pyright', 'texlab', 'jdtls', 'clangd', 'rust_analyzer', 'marksman', 'asm_lsp', 'cmake', 'eslint', 'taplo', 'julials', 'emmet_ls', 'tsserver'}
-- local on_attach = function(client, bufnr)
--   local opts = { buffer = bufnr }
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--   -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--   vim.keymap.set('n', 'gd', '<cmd>Trouble lsp_definitions<cr>', {silent = true, noremap = true})
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--   vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
--   vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
--   vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
--   vim.keymap.set('n', '<leader>wl', function()
--     vim.inspect(vim.lsp.buf.list_workspace_folders())
--   end, opts)
--   vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
--   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--   -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--   vim.keymap.set('n', 'gr', '<cmd>Trouble lsp_references<cr>', {silent = true, noremap = true})
--   vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--   vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
--   vim.keymap.set('n', 'gt', '<cmd>Trouble document_diagnostics<cr>', {silent = true, noremap = true})
--   vim.api.nvim_buf_create_user_command(bufnr, "Format", vim.lsp.buf.formatting, {})
--   if client.server_capabilities.documentSymbolProvider then
--       navic.attach(client, bufnr)
--   end
-- end
--
-- -- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
--
-- -- LSP settings
-- local lspconfig = require 'lspconfig'
--
-- -- gutter icons
-- local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = "󰋽 " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
--
-- vim.diagnostic.config({
--   virtual_text = true,
--   signs = true,
--   underline = true,
--   update_in_insert = false,
--   severity_sort = false,
-- })
-- -- nvim-cmp supports additional completion capabilities
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
-- -- Enable language servers defined in servers
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end
-- -- custom setup for lua
-- -- Example custom server
-- -- Make runtime files discoverable to the server
-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, 'lua/?.lua')
-- table.insert(runtime_path, 'lua/?/init.lua')
--
-- lspconfig.lua_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = runtime_path,
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { 'vim' },
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file('', true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }
--
-- lspconfig.texlab.setup{
--     settings = {
--         texlab = {
--             rootDirectory = ".",
--             build = {
--                 onSave = true
--             },
--             forwardSearch = {
--                 args = {
--                     "--synctex-forward",
--                     "%l:1:%f",
--                     "%p"
--                 },
--                 executable = "zathura",
--                 onSave = true
--             }
--         }
--     }
-- }
-- -- show error in floating window
-- -- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- -- show error in floating window only when hovering over error
-- -- vim.api.nvim_create_autocmd("CursorHold", {
-- --   buffer = bufnr,
-- --   callback = function()
-- --     local opts = {
-- --       focusable = false,
-- --       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
-- --       border = border_type, -- double, rounded, single, shadow, none
-- --       source = 'always',
-- --       prefix = ' ',
-- --       scope = 'cursor',
-- --     }
-- --     vim.diagnostic.open_float(nil, opts)
-- --   end
-- -- })
-- Setup language servers.
local lspconfig = require('lspconfig')
-- local servers = {'pyright', 'texlab', 'jdtls', 'clangd', 'rust_analyzer', 'marksman', 'asm_lsp', 'cmake', 'eslint', 'taplo', 'julials', 'emmet_ls', 'tsserver'}
lspconfig.pyright.setup {}
lspconfig.jdtls.setup {}
lspconfig.clangd.setup {}
lspconfig.marksman.setup {}
lspconfig.cmake.setup {}
lspconfig.eslint.setup {}
lspconfig.taplo.setup {}
lspconfig.julials.setup {}
lspconfig.emmet_ls.setup {}
lspconfig.tsserver.setup {}
lspconfig.texlab.setup {
    settings = {
        texlab = {
            rootDirectory = ".",
            build = {
                onSave = true
            },
            forwardSearch = {
                args = {
                    "--synctex-forward",
                    "%l:1:%f",
                    "%p"
                },
                executable = "zathura",
                onSave = true
            }
        }
    }
}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- gutter icons
local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = "󰋽 " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
