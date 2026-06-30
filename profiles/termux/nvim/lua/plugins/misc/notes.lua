---@type LazySpec
---@diagnostic disable: missing-fields
return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        name = "markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ---@type render.md.UserConfig
        opts = {
            completions = { lsp = { enabled = false } },
            latex = { enabled = false },
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
}
