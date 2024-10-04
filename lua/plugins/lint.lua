require('lint').linters_by_ft = {
  markdown = {'vale'},
}
vim.api.nvim_create_autocmd({ "BufWritePost","TextChanged" }, {
  callback = function()

    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()
  end,
})
