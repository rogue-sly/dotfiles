-- global settings
vim.g.settings = {
    ---@type ThemeName
    ---@readonly
    theme = "duskfox",
}

-- load vim options, lazy.nvim, keymaps, autocmds
require("config")

-- choose colorscheme
vim.cmd.colorscheme(vim.g.settings.theme)

-- language server configs to enable
vim.lsp.enable({
    -- programming
    "clangd",
    "lua_ls",
    "rust_analyzer",
    "vtsls",
    -- shell
    "bashls",
    -- doc
    "texlab",
    "tinymist",
    -- web
    "svelte",
    -- etc
    "mesonlsp",
    "neocmake",
    "tombi",
    "zk",
})
