return {
    "chomosuke/typst-preview.nvim",
    cond = true,
    ft = "typst",
    opts = {
        dependencies_bin = {
            tinymist = vim.fn.exepath("tinymist"),
            websocat = vim.fn.exepath("websocat"),
        },
    },
}
