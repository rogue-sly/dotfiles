local Node = {}

-- Node.eslint = require("extra.collections.webdev.node.eslint")
Node.lsp = require("extra.collections.webdev.node.lsp")
Node.prettier = require("extra.collections.webdev.node.prettier")

---@param lsp TypeScriptLspConfig
function Node.setup(lsp)
    -- Node.eslint:setup()
    Node.lsp:setup(lsp)
    Node.prettier:setup()
end

return Node
