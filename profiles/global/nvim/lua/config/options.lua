-- global vim variables
vim.g.editorconfig = true
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.markdown_recommended_style = 0

-- options
--- shell
local shell = { main = "fish", fallback = "bash" }
vim.o.shell = vim.fn.exepath(shell.main) ~= "" and vim.fn.exepath(shell.main) or vim.fn.exepath(shell.fallback)
--- ui
vim.o.concealcursor = ""
vim.o.conceallevel = 0
vim.o.confirm = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.showtabline = 1
vim.o.signcolumn = "yes"
vim.o.tabline = "%!tabline#activate()"
--- indents
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
--- spell checker
vim.o.spell = false
vim.o.spelllang = "en_us"
--- terminal
vim.o.termguicolors = true
vim.o.termsync = true
--- fold
vim.o.fillchars = "foldopen:,foldclose:,fold: ,foldsep: ,diff:╱,eob: "
vim.o.foldlevel = 99
vim.o.foldtext = ""
--- highlights for spaces and tabs
vim.o.list = false
vim.o.listchars = "tab: ,space:."
--- special
vim.o.autoread = true
vim.o.autowrite = false
vim.o.undofile = true
vim.o.clipboard = "unnamedplus"
vim.o.exrc = true
vim.o.wrap = false
vim.o.scrolloff = 5
--- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

-- diagnostic options
vim.diagnostic.config({
    severity_sort = true,
    underline = true,
    update_in_insert = false,
    virtual_lines = false,
    virtual_text = false,
})

-- WARN: enable experimental UI features
require("vim._core.ui2").enable({})
vim.o.cmdheight = 0
