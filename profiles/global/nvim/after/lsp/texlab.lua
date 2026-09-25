---@type vim.lsp.Config
return {
    settings = {
        texlab = {
            diagnostics = {
                ignoredPatterns = { "^Unused entry" },
            },
        },
    },
}
