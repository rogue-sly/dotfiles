return {
    "zk-org/zk-nvim",
    name = "zk",
    keys = {
        {
            "<localleader>z",
            "",
            desc = "zk.nvim",
        },
        {
            "<localleader>zn",
            "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>",
            desc = "create a new note after asking for its title",
        },
        {
            "<localleader>zo",
            "<Cmd>ZkNotes { sort = { 'modified' }, excludeHrefs = { 'journal/daily' } }<CR>",
            desc = "open notes",
        },
        {
            "<localleader>zd",
            "<Cmd>ZkNotes { sort = { 'modified' }, tags = { 'daily' } }<CR>",
            desc = "open daily notes",
        },
        {
            "<localleader>zt",
            "<Cmd>ZkTags<CR>",
            desc = "open notes associated with the selected tags",
        },
        {
            "<localleader>zf",
            "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
            desc = "search for the notes matching a given query",
        },
        {
            "<localleader>zf",
            ":'<,'>ZkMatch<CR>",
            desc = "search for the notes matching the current visual selection",
            mode = { "v" },
        },
    },
    opts = {
        picker = "snacks_picker",
    },
}
