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
        --- better language support
        { import = "plugins.misc.lang.jls" }, -- Java
        { import = "plugins.misc.lang.markdown" }, -- Markdown
        { import = "plugins.misc.lang.roslyn" }, -- C#
        { import = "plugins.misc.lang.typst" }, -- Typst
        --- other
        { import = "plugins.misc.debug" }, -- debugging support
        { import = "plugins.misc.zettelkasten" }, -- zk-cli integration
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
                -- "tutor",
                "zipPlugin",
            },
        },
    },
})
