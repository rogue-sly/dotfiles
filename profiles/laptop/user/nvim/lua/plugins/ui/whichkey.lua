---@diagnostic disable: missing-fields
return {
    "folke/which-key.nvim",
    ---@type wk.Config
    opts = {
        preset = "helix",
        ---@type wk.Win.opts
        win = { border = "single" },
        icons = { mappings = false },
        ---@type wk.Spec[]
        spec = {
            { "<leader>f", desc = "file/find" },
            { "<leader>p", desc = "profiler" },
            { "<leader>r", desc = "run" },
            { "<leader>s", desc = "search" },
            { "<leader>u", desc = "toggles" },
            { "<leader>w", desc = "write" },
        },
    },
}
