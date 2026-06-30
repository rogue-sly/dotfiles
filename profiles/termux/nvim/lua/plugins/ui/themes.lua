---@type LazySpec
return {
    {
        "EdenEast/nightfox.nvim",
        version = false,
        lazy = false,
        priority = 1000,
        opts = {
            groups = {
                all = {
                    TreesitterContext = { bg = "bg1" },
                    TreesitterContextLineNumber = { fg = "fg3", bg = "bg1" },
                    TreesitterContextBottom = { style = "underline", sp = "fg3" },
                },
            },
        },
    },
}
