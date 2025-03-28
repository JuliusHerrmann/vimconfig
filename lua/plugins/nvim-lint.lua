return {
	"mfussenegger/nvim-lint",
    event = {"BufWritePre", "InsertLeave"},
    enabled = false,
    config = function()
        require('lint').linters_by_ft = {
            markdown = {'vale'},
        }
        vim.api.nvim_create_autocmd({ "BufWritePost","TextChanged" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
