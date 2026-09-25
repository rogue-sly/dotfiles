return {
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
                ["ROADMAP.md"] = { glyph = "", hl = "MiniIconsYellow" },
            },
        })
        mini_icons.mock_nvim_web_devicons()
    end,
}
