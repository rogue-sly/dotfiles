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
    end,
    ---@type conform.setupOpts
    opts = {
        format_on_save = { lsp_format = "fallback" },
        default_format_opts = { lsp_format = "fallback" },
        formatters_by_ft = {
            c = { "clang-format" },
            cpp = { "clang-format" },
            fish = { "fish_indent" },
            lua = { "stylua", lsp_format = "never" },
            markdown = { "oxfmt" },
            meson = { "meson" },
            python = { "ruff_format" },
            rust = { "rustfmt" },
            typst = { "typstyle" },
        },
    },
}
