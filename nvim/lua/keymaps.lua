local map = vim.keymap.set

-- save
map(
    { "n", "v", "i" },
    "<C-s>",
    function()
        vim.cmd("write")

        require("conform").format({
            async = true,
            lsp_fallback = true,
        })
    end,
    {
        desc = "Save and format",
    }
)


-- Neo-tree
map(
    "n",
    "<C-t>",
    "<cmd>Neotree toggle<CR>",
    {
        desc = "Toggle Neo-tree",
    }
)


-- terminal
map(
    "n",
    "<C-q>",
    "<cmd>ToggleTerm<CR>",
    {
        desc = "Toggle terminal",
    }
)


-- find files
map(
    "n",
    "<leader><leader>",
    function()
        require("fff").find_files()
    end,
    {
        desc = "Find files",
    }
)


-- grep
map(
    "n",
    "<C-p>",
    function()
        require("fff").live_grep()
    end,
    {
        desc = "Live grep",
    }
)


-- diagnostics
map(
    "n",
    "<leader>xx",
    "<cmd>Trouble diagnostics toggle<CR>",
    {
        desc = "Diagnostics",
    }
)


-- code actions
map(
    "n",
    "<leader>ca",
    function()
        require("tiny-code-action").code_action()
    end,
    {
        desc = "Code actions",
    }
)
