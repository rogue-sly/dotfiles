require("extra.collections.webdev.other").setup()

if vim.fn.filereadable(vim.fn.getcwd() .. "/package.json") == 1 then
    require("extra.collections.webdev.node").setup("ts-ls")
    return
end
