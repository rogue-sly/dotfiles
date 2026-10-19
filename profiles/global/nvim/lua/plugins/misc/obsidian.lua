return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false, -- this will be removed in 4.0.0
        ui = { enable = false },
        workspaces = {
            {
                name = "mind",
                path = "~/Documents/Vaults/Mind",
            },
            {
                name = "univerisy",
                path = "~/Documents/Vaults/University",
            },
        },
    },
}
