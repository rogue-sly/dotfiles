local M = {}

--- simple tabline that only displays the name of the file
function M.activate()
    local tabs = {}
    for i = 1, vim.fn.tabpagenr("$") do
        local buf = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
        local name = vim.fn.fnamemodify(vim.fn.bufname(buf), ":t")
        if name == "" then
            name = "[No Name]"
        end
        tabs[i] = string.format(
            "%s%%%dT %s%s %d ",
            i == vim.fn.tabpagenr() and "%#TabLineSel#" or "%#TabLine#",
            i,
            name,
            vim.bo[buf].modified and " [+]" or "",
            i
        )
    end
    return table.concat(tabs) .. "%#TabLineFill#%T"
end

return M
