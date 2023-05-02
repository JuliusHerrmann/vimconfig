require('tabby.tabline').use_preset('active_wins_at_tail', {
    theme = {
        fill = 'TabLineFill', -- tabline background
        head = 'TabLine', -- head element highlight
        current_tab = 'TabLineSel', -- current tab label highlight
        tab = 'TabLine', -- other tab label highlight
        win = 'TabLine', -- window highlight
        tail = 'TabLine', -- tail element highlight
    },
    nerdfont = true, -- whether use nerdfont
    tab_name = {
        name_fallback = function(tabid)
            return ""
        end,
    },
    buf_name = {
        mode = "tail",
    },
})
-- local filename = require('tabby.module.filename')
-- local api = require('tabby.module.api')
-- local tab_name = require('tabby.feature.tab_name')
--
-- local hl_head = 'TabLine'
-- local hl_tabline = 'TabLine'
-- local hl_normal = 'Normal'
-- local hl_tabline_sel = 'TabLineSel'
-- local hl_tabline_fill = 'TabLineFill'
--
-- local function tab_label(tabid, active)
--   local icon = active and '' or ''
--   local number = api.get_tab_number(tabid)
--   local name = tab_name.get(tabid)
--   return string.format(' %s %d: %s ', icon, number, name)
-- end
--
-- local function clear_tab_label(tabid, active)
--   local icon = active and '' or ''
--   local name = tab_name.get_raw(tabid)
--   local number = vim.api.nvim_tabpage_get_number(tabid)
--   local wins = api.get_tab_wins(tabid)
--   local labels = {}
--   if name == '' then
--     labels = { '', icon, number, string.format('[%d]', #wins), '' }
--   else
--     labels = { '', icon, number, name, string.format('[%d]', #wins), '' }
--   end
--   return table.concat(labels, ' ')
-- end
--
-- local function win_label(winid, top)
--   local icon = top and '' or ''
--   return string.format(' %s %s ', icon, filename.unique(winid))
-- end
--
-- require('tabby.tabline').set(function(line)
--     local cwd = ' ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. ' '
--     return {
--         {
--             { cwd, hl = hl_tabline_fill },
--             line.sep('', hl_head, hl_tabline_fill),
--         },
--         ".....",
--     }
-- end, {})

vim.o.showtabline = 2
-- function tab_name(tab) 
--    return string.gsub(tab,"%[..%]","") 
-- end
--
--
-- function tab_modified(tab)
--     wins = require("tabby.module.api").get_tab_wins(tab)
--     for i, x in pairs(wins) do
--         if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
--             return ""
--         end
--     end
--     return ""
-- end
--
-- function lsp_diag(buf) 
--     diagnostics = vim.diagnostic.get(buf)
--     local count = {0, 0, 0, 0}
--     
--     for _, diagnostic in ipairs(diagnostics) do
--         count[diagnostic.severity] = count[diagnostic.severity] + 1
--     end
--     if count[1] > 0 then
--         return vim.bo[buf].modified and "" or ""
--     elseif count[2] > 0 then 
--         return vim.bo[buf].modified and "" or ""
--     end
--     return vim.bo[buf].modified and "" or ""
-- end 
--
-- local function get_modified(buf)
--     if vim.bo[buf].modified then
--         return ''
--     else
--         return ''
--     end
-- end
--
-- local function buffer_name(buf)
--     if string.find(buf,"NvimTree") then 
--         return "NvimTree"
--     end
--     return buf
-- end
--
-- local theme = {
--     fill = 'TabLineFill', -- tabline background
--     head = 'TabLine', -- head element highlight
--     current_tab = 'TabLineSel', -- current tab label highlight
--     tab = 'TabLine', -- other tab label highlight
--     win = 'TabLine', -- window highlight
--     tail = 'TabLine', -- tail element highlight
-- }
--
-- require('tabby.tabline').set(function(line)
--   return {
--     {
--       { '  ', hl = theme.head },
--       line.sep('', theme.head, theme.fill),
--     },
--     line.tabs().foreach(function(tab)
--       local hl = tab.is_current() and theme.current_tab or theme.inactive_tab
--       return {
--         line.sep('', hl, theme.fill),
--         tab.number(),
--         "",
--         tab_name(tab.name()),
--         "",
--         -- tab_modified(tab.id),
--         line.sep('', hl, theme.fill),
--         hl = hl,
--         margin = ' ',
--       }
--     end),
--     line.spacer(),
--     -- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
--     --   local hl = win.is_current() and theme.current_tab or theme.inactive_tab
--     --   return {
--     --     line.sep('', hl, theme.fill),
--     --     win.file_icon(),
--     --     "",
--     --     buffer_name(win.buf_name()),
--     --     "",
--     --     lsp_diag(win.buf().id),
--     --     line.sep('', hl, theme.fill),
--     --     hl = hl,
--     --     margin = ' ',
--     --   }
--     -- end),
--     {
--       line.sep('', theme.tail, theme.fill),
--       { '  ', hl = theme.tail },
--     },
--     hl = theme.fill,
--   }
-- end)
