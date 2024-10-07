return {
	"norcalli/nvim-colorizer.lua",
    enabled = true,
    cmd = "ColorizerToggle",
    ft = "css, scss, html, javascript, typescript, vue, svelte, lua",
    config = function()
        require("colorizer").setup()
    end,
}
