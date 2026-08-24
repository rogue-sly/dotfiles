---@type LazySpec
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = { "jbyuki/one-small-step-for-vimkind" },
        version = false,
        lazy = false,
        keys = {
            {
                "<F9>",
                function()
                    require("dap").continue()
                end,
                desc = "DAP: continue",
            },
            {
                "<F10>",
                function()
                    require("dap").step_over()
                end,
                desc = "DAP: step over",
            },
            {
                "<F11>",
                function()
                    require("dap").step_into()
                end,
                desc = "DAP: step into",
            },
            {
                "<F12>",
                function()
                    require("dap").step_out()
                end,
                desc = "DAP: step out",
            },
            {
                "<leader>db",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "DAP: toggle breakpoint",
            },
            {
                "<leader>dB",
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                desc = "DAP: conditional breakpoint",
            },
            {
                "<leader>dr",
                function()
                    require("dap").repl.open()
                end,
                desc = "DAP: repl",
            },
        },
        config = function()
            local dap = require("dap")

            -- Neovim Lua
            dap.configurations.lua = {
                {
                    type = "nlua",
                    request = "attach",
                    name = "Attach to running Neovim instance",
                },
            }
            dap.adapters.nlua = function(callback, config)
                callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
            end

            -- C/C++/Rust
            dap.adapters.lldb = {
                type = "executable",
                command = "lldb-dap",
            }
            dap.configurations.c = {
                {
                    name = "Launch file",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    args = function()
                        local args_string = vim.fn.input("Program arguments: ")
                        return vim.split(args_string, " +")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }
            dap.configurations.cpp = dap.configurations.c
            dap.configurations.rust = dap.configurations.c
        end,
    },
    {
        "igorlfs/nvim-dap-view",
        dependencies = { "mfussenegger/nvim-dap" },
        lazy = false,
        keys = {
            {
                "<leader>dvc",
                function()
                    require("dap-view").toggle()
                end,
                desc = "DAP: toggle view",
            },
            {
                "<leader>dvw",
                function()
                    require("dap-view").show_view("watches")
                end,
                desc = "DAP: watches",
            },
            {
                "<leader>dvb",
                function()
                    require("dap-view").show_view("breakpoints")
                end,
                desc = "DAP: breakpoints",
            },
            {
                "<leader>dvt",
                function()
                    require("dap-view").show_view("console")
                end,
                desc = "DAP: console",
            },
            {
                "<leader>dve",
                function()
                    require("dap-view").show_view("exceptions")
                end,
                desc = "DAP: exceptions",
            },
            {
                "<leader>dvs",
                function()
                    require("dap-view").show_view("sessions")
                end,
                desc = "DAP: sessions",
            },
        },
        ---@type dapview.Config
        opts = {},
    },
}
