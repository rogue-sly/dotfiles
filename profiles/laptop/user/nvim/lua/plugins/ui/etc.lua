---@type LazySpec
return {
    -- fancy icons
    {
        "nvim-mini/mini.icons",
        config = function()
            local mini_icons = require("mini.icons")

            mini_icons.setup({
                default = {},
                extension = {},
                file = {
                    ["init.lua"] = { glyph = "󰢱", hl = "MiniIconsAzure" },
                    ["mise.lock"] = { glyph = "", hl = "MiniIconsYellow" },
                    ["LICENSE"] = { glyph = "", hl = "MiniIconsYellow" },
                    ["LICENCE"] = { glyph = "", hl = "MiniIconsYellow" },
                    ["LICENSE-MIT"] = { glyph = "", hl = "MiniIconsYellow" },
                    ["LICENSE-APACHE"] = { glyph = "", hl = "MiniIconsYellow" },
                    ["ROADMAP.md"] = { glyph = " ", hl = "MiniIconsYellow" },
                },
            })
            mini_icons.mock_nvim_web_devicons()
        end,
    },
    -- color highlight
    {
        -- For color highlighting
        "catgoose/nvim-colorizer.lua",
        ---@type colorizer.Options
        ---@diagnostic disable-next-line: missing-fields
        opts = {
            ---@diagnostic disable-next-line: missing-fields
            options = {
                display = {
                    mode = "virtualtext",
                },
            },
            filetypes = {
                "*",
                "!popup",
                "!lazy",
                "!noice",
                "!snacks_terminal",
            },
        },
    },
}
