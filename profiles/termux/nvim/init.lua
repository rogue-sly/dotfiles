-- WARN: enable experimental UI features
require("vim._core.ui2").enable({})
vim.o.cmdheight = 0

-- utilities & helper functions
_G.utils = require("extra.utils")
-- global settings
_G.settings = { colorscheme = "duskfox" }

require("config") -- load vim options, lazy.nvim, keymaps, autocmds
require("extra.collections") -- loads specialized configs (godot, webdev, etc...)

-- choose colorscheme
vim.cmd.colorscheme(settings.colorscheme)

-- language server configs to enable
vim.lsp.enable({
    -- shell langs
    "bash-ls",
    -- programming langs
    "dart-ls",
    "emmylua-ls",
    "gopls",
    "ty",
    -- other
    "json-ls",
    "mpls",
    -- "rumdl",
    "taplo",
    "tinymist",
    "zk",
})
