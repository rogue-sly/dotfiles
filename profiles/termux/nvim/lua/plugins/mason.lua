---@type LazySpec
return {
    "mason-org/mason.nvim",
    ---@type MasonSettings
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
}
