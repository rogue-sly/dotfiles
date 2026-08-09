---@type vim.lsp.Config
return {
    cmd = { "jason" },
    filetypes = { "json", "jsonc" },
    root_markers = {},
    settings = {
        json = {
            format = { enable = true },
        },
    },
}
