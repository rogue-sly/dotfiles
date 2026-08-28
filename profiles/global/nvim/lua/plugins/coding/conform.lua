---@type LazySpec
return {
    "stevearc/conform.nvim",
    version = false,
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            ---@diagnostic disable-next-line: param-type-mismatch
            require("conform").format({
                async = true,
                lsp_format = "fallback",
                range = range,
            })
        end, { desc = "Format file", range = true })

        vim.g.auto_format_is_off = false
        vim.api.nvim_create_user_command("ConformToggle", function()
            vim.g.auto_format_is_off = not vim.g.auto_format_is_off
        end, {
            desc = "Toggle autoformat-on-save",
        })
    end,
    opts = function()
        ---@type conform.setupOpts
        return {
            format_on_save = function()
                if vim.g.auto_format_is_off then
                    return
                end
                return { timeout_ms = 500, lsp_format = "fallback" }
            end,
            default_format_opts = { lsp_format = "fallback" },
            formatters_by_ft = {
                -- programming langs
                c = { "clang-format" },
                cpp = { "clang-format" },
                lua = { "stylua", lsp_format = "never" },
                python = { "ruff_format" },
                rust = { "rustfmt" },
                -- web stuff
                javascript = { "oxfmt" },
                typescript = { "oxfmt" },
                svelte = { "oxfmt" },
                -- markup/doc
                markdown = { "oxfmt" },
                typst = { "typstyle" },
                -- etc
                fish = { "fish_indent" },
                json = { "oxfmt" },
                jsonc = { "oxfmt" },
                meson = { "meson" },
            },
        }
    end,
}
