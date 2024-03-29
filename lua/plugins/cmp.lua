-- nvim-cmp setup
local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

local cmp = require 'cmp'
cmp.setup ({
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
            -- border = border "CmpBorder"
        },
        documentation = {
            -- border = border "CmpDocBorder",
        },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
                symbol_map = {
                    Text = "󰉿",
                    Method = "󰆧",
                    Function = "󰊕",
                    Constructor = "",
                    Field = "󰜢",
                    Variable = "󰀫",
                    Class = "󰠱",
                    Interface = "",
                    Module = "",
                    Property = "󰜢",
                    Unit = "󰑭",
                    Value = "󰎠",
                    Enum = "",
                    Keyword = "󰌋",
                    Snippet = "",
                    Color = "󰏘",
                    File = "󰈙",
                    Reference = "󰈇",
                    Folder = "󰉋",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "󰙅",
                    Event = "",
                    Operator = "󰆕",
                    TypeParameter = "",
                },
            })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. strings[1] .. " "

            if #(strings) > 1 then
                kind.menu = "    " .. strings[2]
            else
                kind.menu = "    " .. "?"
            end

            return kind
        end,
    },
    -- window = {
    --   completion = {
    --     border = border "CmpBorder",
    --     winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    --   },
    --   documentation = {
    --     border = border "CmpDocBorder",
    --   },
    -- },
    -- formatting = {
    --   format = lspkind.cmp_format(),
    -- },
    snippet = {
        expand = function(args)
            Luasnip.lsp_expand(args.body)
        end,
    },
    completion = {
        completeopt = 'menu,menuone'
    },
    preselect = cmp.PreselectMode.Item,
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        -- this always chooses first entry
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        -- ["<CR>"] = cmp.mapping({
        --     i = function(fallback)
        --         if cmp.visible() and cmp.get_active_entry() then
        --             cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        --         else
        --             fallback()
        --         end
        --     end,
        --     s = cmp.mapping.confirm({ select = true }),
        --     c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        -- }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif Luasnip.expand_or_locally_jumpable() then
                Luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif Luasnip.jumpable(-1) then
                Luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' }
    },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
