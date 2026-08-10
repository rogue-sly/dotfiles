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
        -- data only plugins
        { "neovim/nvim-lspconfig", version = false },
        -- essential plugins
        { import = "plugins.ui" }, -- colorschemes, improved lsp UI and more
        { import = "plugins.editor" }, -- fuzzy finder, filetree, git integration & more
        { import = "plugins.coding" }, -- code completion, formatting, linting, etc...
        -- other (removable plugins)
        { import = "plugins.misc.jls", enabled = true }, -- Java support
        { import = "plugins.misc.roslyn", enabled = true }, -- C# support
        { import = "plugins.misc.markdown", enabled = true }, -- better markdown
        { import = "plugins.misc.typst", enabled = true }, -- better typst
    },
    checker = { enabled = false },
    defaults = { version = "*" },
    install = { colorscheme = { vim.g.settings.theme } },
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
