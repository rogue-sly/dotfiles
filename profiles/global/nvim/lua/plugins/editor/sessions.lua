return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    keys = {
        {
            "<leader>qs",
            function()
                require("persistence").load()
            end,
            desc = "load session for cwd",
        },
        {
            "<leader>ql",
            function()
                require("persistence").load({ last = true })
            end,
            desc = "load last session",
        },
        {
            "<leader>qS",
            function()
                require("persistence").select()
            end,
            desc = "select session",
        },
        {
            "<leader>qd",
            function()
                require("persistence").stop()
            end,
            desc = "disable persistence",
        },
    },
}
