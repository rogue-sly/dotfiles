---@type LazySpec
---@diagnostic disable: missing-fields
return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        name = "markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ---@type render.md.UserConfig
        opts = {
            anti_conceal = { enabled = true },
            bullet = { enabled = false },
            checkbox = { enabled = false },
            code = { enabled = false },
            completions = { lsp = { enabled = true } },
            heading = { enabled = false },
            latex = { enabled = false },
            sign = { enabled = false },
            overrides = {
                buflisted = {},
                buftype = {
                    nofile = {
                        padding = { highlight = "NormalFloat" },
                        sign = { enabled = false },
                        code = {
                            enabled = true,
                            left_pad = 0,
                            right_pad = 0,
                        },
                    },
                },
                filetype = {},
            },
        },
    },
    {
        "yousefhadder/markdown-plus.nvim",
        enabled = true,
        ft = "markdown", -- Load on markdown files by default
        config = function()
            require("markdown-plus").setup({
                -- Configuration options (all optional)
                enabled = true,
                features = {
                    list_management = false, -- List management features
                    text_formatting = true, -- Text formatting features
                    headers_toc = true, -- Headers + TOC features
                    links = true, -- Link management features
                    images = true, -- Image link management features
                    quotes = true, -- Blockquote toggling feature
                    callouts = true, -- GFM callouts/admonitions feature
                    code_block = true, -- Code block conversion feature
                    table = true, -- Table support features
                    footnotes = true, -- Footnotes management features
                },
                footnotes = { -- Footnotes configuration
                    section_header = "Footnotes", -- Header for footnotes section
                    confirm_delete = true, -- Confirm before deleting footnotes
                },
            })
        end,
    },
    {
        "zk-org/zk-nvim",
        name = "zk",
        lazy = false,
        keys = {
            {
                "<localleader>z",
                "",
                desc = "zettelkasten",
            },
            {
                "<localleader>zn",
                "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>",
                desc = "create a new note after asking for its title",
            },
            {
                "<localleader>zo",
                "<Cmd>ZkNotes { sort = { 'modified' }, excludeHrefs = { 'journal/daily' } }<CR>",
                desc = "open notes",
            },
            {
                "<localleader>zd",
                "<Cmd>ZkNotes { sort = { 'modified' }, tags = { 'daily' } }<CR>",
                desc = "open daily notes",
            },
            {
                "<localleader>zt",
                "<Cmd>ZkTags<CR>",
                desc = "open notes associated with the selected tags",
            },
            {
                "<localleader>zf",
                "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
                desc = "search for the notes matching a given query",
            },
            {
                "<localleader>zf",
                ":'<,'>ZkMatch<CR>",
                desc = "search for the notes matching the current visual selection",
                mode = { "v" },
            },
        },
        opts = {
            picker = "snacks_picker",
        },
    },
    {
        "chomosuke/typst-preview.nvim",
        enabled = true,
        lazy = false,
        opts = {},
    },
}
