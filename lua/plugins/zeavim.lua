return {
"KabbAmine/zeavim.vim",
    cmd = { "Zeavim" },
    keys = {
        { "<leader>z", "<cmd>Zeavim<cr>", desc = "Open definition in Zeal" },
    },
    config = function()
        -- Needs to be defined in a function to avoid errors
    end,
}
