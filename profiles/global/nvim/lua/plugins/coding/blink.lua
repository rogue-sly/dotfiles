---@diagnostic disable: missing-fields
---@type LazySpec
return {
    "Saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets", version = false },
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = "enter" },
        cmdline = { enabled = true, completion = { ghost_text = { enabled = true } } },
        appearance = { nerd_font_variant = "normal" },
        completion = {
            menu = { auto_show = false },
            documentation = { window = { border = "padded", scrollbar = true } },
            list = { selection = { preselect = false, auto_insert = false } },
            ghost_text = { enabled = true },
            trigger = { prefetch_on_insert = false },
        },
        signature = { enabled = true },
        snippets = { preset = "default" },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
}
