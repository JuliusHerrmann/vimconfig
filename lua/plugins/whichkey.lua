-- vim whichkey PLEASE UPDATE ACCORDING TO NEW MAPPINGS
local wk = require'which-key'
wk.register({
  e = "show diagnostic",
  c ={
    name = "copy options",
    o = "show copy history",
    ["<space>"] = "show copy history",
    a = "lsp code actions"
  },
  ["?"] = "telescope oldfiles",
  ["<space>"] = "telescope files",
  b = "telescope buffers",
  D = "lsp type definitions",
  q = "diagnostic loclist",
  rn = "lsp rename",
  s = {
    name = "telescope actions",
    o = "document symbols",
    b = "buffer fuzzy search",
    p = "live grep in project",
  },
  w = {
    name = "lsp workspace",
    a = "add workspace folder",
    l = "list workspace folders",
    r = "remove workspace folder",
  },
  a = "Buffer Pick"
}, {prefix = "<leader>"})
wk.setup({
  window = {
    border = "none"
  }
})
