---@diagnostic disable: missing-parameter
-- NOTE: bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- essential plugins
        { import = "plugins.mason" }, -- manage tools (yup I still need it for termux)
        { import = "plugins.ui" }, -- colorschemes, improved lsp UI and more
        { import = "plugins.editor" }, -- fuzzy finder, filetree, scrollbar, git integration & more
        { import = "plugins.coding" }, -- code completion, formatting, linting, etc...
        -- other (removable plugins)
        { import = "plugins.misc.notes", enabled = true }, -- note taking in neovim
        { import = "plugins.misc.rustacean", enabled = true }, -- better DX when working with rust
    },
    checker = { enabled = false },
    defaults = { version = "*" },
    install = { colorscheme = { settings.colorscheme } },
    news = { lazy = true },
    rocks = { enabled = false },
    ui = { wrap = true },
    performance = {
        cache = { enabled = true },
        reset_packpath = true,
        rtp = {
            reset = true,
            paths = {},
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
