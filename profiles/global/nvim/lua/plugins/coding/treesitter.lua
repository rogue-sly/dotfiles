return {
    -- treesitter-nvim
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        version = false,
        lazy = false,
        init = function()
            require("vim.treesitter.query").add_predicate("is-mise?", function(_, _, bufnr, _)
                local filepath = vim.api.nvim_buf_get_name(tonumber(bufnr) or 0)
                local filename = vim.fn.fnamemodify(filepath, ":t")
                return string.match(filename, ".*mise.*%.toml$") ~= nil
            end, { force = true, all = false })
        end,
        ---@type TSConfig|fun(): TSConfig?
        config = function()
            local ts = require("nvim-treesitter")
            local parsers = {
                -- languages
                "javascript",
                "c",
                "cpp",
                "lua",
                "luadoc",
                "rust",
                "typescript",
                "vim",
                "vimdoc",
                -- shell
                "bash",
                "fish",
                -- markup
                "latex",
                "markdown",
                "markdown_inline",
                "typst",
                "slint",
                "css",
                "svelte",
                --
                "json",
                "meson",
                "toml",
                "yaml",
                -- misc
                "bibtex",
                "comment",
                "diff",
                "query",
                "regex",
            }

            ts.install(parsers)

            -- Not every tree-sitter parser is the same as the file type detected
            -- So the patterns need to be registered more cleverly
            local patterns = {}
            for _, parser in ipairs(parsers) do
                local parser_patterns = vim.treesitter.language.get_filetypes(parser)
                for _, pp in pairs(parser_patterns) do
                    table.insert(patterns, pp)
                end
            end

            vim.api.nvim_create_autocmd("FileType", {
                pattern = patterns,
                callback = function()
                    vim.treesitter.start()
                    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    vim.wo.foldmethod = "expr"
                end,
            })
        end,
    },
    -- context
    {
        "nvim-treesitter/nvim-treesitter-context",
        ---@type TSContext.UserConfig
        opts = { enable = true },
    },
}
