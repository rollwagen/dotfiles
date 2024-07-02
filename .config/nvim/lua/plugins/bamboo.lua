return {
    -- https://github.com/ribru17/bamboo.nvim
    -- "Warm Green Theme for Neovim and Beyond"
    {
        "ribru17/bamboo.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("bamboo").setup({
                -- optional configuration here
            })
            require("bamboo").load()
        end,
    },
}
