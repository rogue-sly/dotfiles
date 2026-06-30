---@alias TypeScriptLspConfig "ts-ls" | "tsgo"

local Lsp = {
    ts_ls = require("extra.collections.webdev.node.lsp.ts_ls"),
    tsgo = require("extra.collections.webdev.node.lsp.tsgo"),
}

---@param lsp TypeScriptLspConfig
function Lsp:setup(lsp)
    if lsp == "ts-ls" then
        vim.lsp.config("typescript-ls", self.ts_ls)
        vim.lsp.enable("typescript-ls")
    else
        vim.lsp.config("tsgo-ls", self.tsgo)
        vim.lsp.enable("tsgo-ls")
    end
end

return Lsp
