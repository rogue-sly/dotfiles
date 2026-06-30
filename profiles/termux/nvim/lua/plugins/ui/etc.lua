---@type LazySpec
return {
    -- fancy icons
    {
        "nvim-mini/mini.icons",
        config = function()
            local mini_icons = require("mini.icons")

            mini_icons.setup({
                default = {},
                extension = {
                    lua = { hl = "MiniIconsBlue" },
                },
                file = {
                    ["init.lua"] = { glyph = "", hl = "MiniIconsBlue" },
                    ["mise.lock"] = { glyph = "", hl = "MiniIconsYellow" },
                    ["LICENSE"] = { glyph = "", hl = "MiniIconsYellow" },
                    ["LICENCE"] = { glyph = "", hl = "MiniIconsYellow" },
                    ["LICENSE-MIT"] = { glyph = "", hl = "MiniIconsYellow" },
                    ["LICENSE-APACHE"] = { glyph = "", hl = "MiniIconsYellow" },
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
            options = {
                display = {
                    mode = "background",
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
    -- breadcrumbs
    { "Bekaboo/dropbar.nvim", opts = {} },
}
