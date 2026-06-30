-- global settings
_G.settings = {
    ---@readonly
    theme = "tokyonight-night",
}

-- prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- load vim options, lazy.nvim, keymaps, autocmds
require("config")

-- choose colorscheme
vim.cmd.colorscheme(settings.theme)

-- language server configs to enable
vim.lsp.enable({
    "clangd",
    "lua_ls",
    "muon",
    "rust_analyzer",
    --
    "tinymist",
    "zk",
    "tombi",
})
