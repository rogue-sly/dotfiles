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

-- highlight selection on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    pattern = "*",
    desc = "highlight selection on yank",
    callback = function()
        vim.highlight.on_yank({ timeout = 200, visual = true })
    end,
})

-- restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.api.nvim_win_set_cursor(0, mark)
            -- defer centering slightly so it's applied after render
            vim.schedule(function()
                vim.cmd("normal! zz")
            end)
        end
    end,
})
