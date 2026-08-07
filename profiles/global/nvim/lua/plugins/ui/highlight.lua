---@diagnostic disable: missing-fields
return {
    -- For color highlighting
    "catgoose/nvim-colorizer.lua",
    ---@type colorizer.Options
    opts = {
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
}
