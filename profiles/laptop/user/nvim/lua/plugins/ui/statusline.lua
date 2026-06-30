return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local dmode_enabled = false
        vim.api.nvim_create_autocmd("User", {
            pattern = "DebugModeChanged",
            callback = function(args)
                dmode_enabled = args.data.enabled
            end,
        })

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
                disabled_filetypes = {},
                always_divide_middle = false,
                extensions = { "neo-tree", "lazy" },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(str)
                            return dmode_enabled and "DEBUG" or str
                        end,
                        color = function(tb)
                            return dmode_enabled and "dCursor" or tb
                        end,
                    },
                },
                lualine_b = { "branch", "diff" },
                lualine_c = {
                    "filename",
                    "diagnostics",
                    "searchcount",
                },

                lualine_x = {
                    "encoding",
                    "filetype",
                    "lsp_status",
                },
                lualine_y = {
                    { "progress", separator = " ", padding = { left = 1, right = 0 } },
                    { "location", padding = { left = 0, right = 1 } },
                },
			-- stylua: ignore
			lualine_z = { function() return  os.date("%I:%M %p") end, },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
        })
    end,
}
