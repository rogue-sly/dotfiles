---@type LazySpec
return {
    "nvimdev/guard.nvim",
    dependencies = { "nvimdev/guard-collection" },
    lazy = false,
    init = function()
        vim.g.guard_config = {
            always_save = false, -- always save file after call Guard fmt
            auto_lint = true, -- automatic linting
            fmt_on_save = true, -- format on write to buffer
            lint_interval = 500, -- how frequently can linters be called
            lsp_as_default_formatter = true, -- use lsp if no formatter was defined for this filetype
            refresh_diagnostic = true, -- show diagnostic after format done
            save_on_fmt = false, -- whether or not to save the buffer after formatting
        }
    end,
    config = function()
        local ft = require("guard.filetype")
        local languages = {
            -- guard collection
            ["bash"] = { fmt = "shfmt" },
            ["dart"] = { fmt = "lsp" },
            ["fish"] = { fmt = "fish_indent" },
            -- ["go"] = { fmt = "gofmt" },
            ["lua"] = { fmt = "stylua" },
            -- ["python"] = { fmt = "ruff" },
            ["toml"] = { fmt = "taplo" },
            -- ["typst"] = { fmt = "typstyle" },
            ["xml"] = { fmt = "xmllint" },
            ["json,yaml"] = { fmt = "prettier" },
            -- custom
            ["rust"] = { fmt = { cmd = "rustfmt", args = { "--emit", "stdout" }, stdin = true } },
            ["markdown"] = {
                fmt = {
                    cmd = "prettier",
                    args = { "--stdin-filepath", "--prose-wrap=preserve" },
                    fname = true,
                    stdin = true,
                },
            },
        }

        for lang, config in pairs(languages) do
            if config.fmt ~= nil then
                ft(lang):fmt(config.fmt)
            end
        end
    end,
    keys = {
        { "<localleader>df", "<cmd>Guard fmt<cr>", desc = "format (guard.nvim)", mode = { "n" } },
    },
}
