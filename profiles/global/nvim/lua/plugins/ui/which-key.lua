return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    ---@type wk.Opts
    opts = {
        preset = "helix",
        spec = {
            -- <leader> mapping groups
            { "<leader>d", group = "debug", mode = { "n", "x" } },
            { "<leader>f", group = "file/find", mode = { "n", "x" } },
            { "<leader>p", group = "profiler", mode = { "n", "x" } },
            { "<leader>r", group = "run", mode = { "n", "x" } },
            { "<leader>s", group = "search", mode = { "n", "x" } },
            { "<leader>u", group = "toggles", mode = { "n", "x" } },
            { "<leader>w", group = "write", mode = { "n", "x" } },
            -- <localleader> LSP mapping groups
            { "<localleader>c", group = "code", mode = "n" },
            { "<localleader>b", group = "buffer", mode = "n" },
            { "<localleader>d", group = "document", mode = "n" },
            { "<localleader>g", group = "goto", mode = "n" },
            { "<localleader>l", group = "line", mode = "n" },
            { "<localleader>r", group = "rename", mode = "n" },
            { "<localleader>u", group = "toggles", mode = "n" },
            { "<localleader>w", group = "workspace", mode = "n" },
        },
    },
}
