return {
	"olimorris/onedarkpro.nvim",
	lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
        style = 'dark'
    },
    config = function()
        vim.cmd([[colorscheme onedark]])
    end,
}
