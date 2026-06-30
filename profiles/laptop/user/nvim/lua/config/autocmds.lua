-- macro recording on notify
vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
        vim.notify(
            string.format("Recording macro to [%s]", vim.fn.reg_recording()),
            vim.log.levels.INFO,
            { title = "Macro" }
        )
    end,
})

-- macro recording done notify
vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
        vim.notify("Stopped recording macro", vim.log.levels.INFO, { title = "Macro" })
    end,
})
