---@type LazySpec
return {
    "2giosangmitom/sqmeow.nvim",
    version = "*",
    dependencies = { "MunifTanjim/nui.nvim" },
    build = function()
        require("sqmeow").install()
    end,
    opts = {},
    cmd = "Sqmeow",
}
