---@type LazySpec
return {
    "vyfor/cord.nvim",
    ---@type CordConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        enabled = false,
        buttons = {
            --[[ {
                label = "View Repository",
                -- stylua: ignore
				url = function(opts) return opts.repo_url end,
            }, ]]
        },
    },
}
