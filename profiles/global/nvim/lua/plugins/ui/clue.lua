return {
    "nvim-mini/mini.clue",
    version = "*",
    opts = function()
        local miniclue = require("mini.clue")
        return {
            triggers = {
                -- Leader trigger
                { mode = { "n", "x" }, keys = "<leader>" },
                -- LSP (<localleader>) trigger
                { mode = { "n", "x" }, keys = "<localleader>" },
                -- `[` and `]` keys
                { mode = "n", keys = "[" },
                { mode = "n", keys = "]" },
                -- Window commands
                { mode = "n", keys = "<C-w>" },
            },
            clues = {
                -- <leader> mapping groups
                { mode = { "n", "x" }, keys = "<leader>f", desc = "+file/find" },
                { mode = { "n", "x" }, keys = "<leader>p", desc = "+profiler" },
                { mode = { "n", "x" }, keys = "<leader>r", desc = "+run" },
                { mode = { "n", "x" }, keys = "<leader>s", desc = "+search" },
                { mode = { "n", "x" }, keys = "<leader>u", desc = "+toggles" },
                { mode = { "n", "x" }, keys = "<leader>w", desc = "+write" },
                -- <localleader> LSP mapping groups
                { mode = "n", keys = "<localleader>c", desc = "+code" },
                { mode = "n", keys = "<localleader>b", desc = "+buffer" },
                { mode = "n", keys = "<localleader>d", desc = "+document" },
                { mode = "n", keys = "<localleader>g", desc = "+goto" },
                { mode = "n", keys = "<localleader>l", desc = "+line" },
                { mode = "n", keys = "<localleader>r", desc = "+rename" },
                { mode = "n", keys = "<localleader>u", desc = "+toggles" },
                { mode = "n", keys = "<localleader>w", desc = "+workspace" },
                -- Built-in key hints
                miniclue.gen_clues.square_brackets(),
                miniclue.gen_clues.windows(),
            },
            window = {
                delay = 0,
                config = { border = "rounded" },
            },
        }
    end,
}
