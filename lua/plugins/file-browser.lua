return {
    config = function()
    vim.keymap.set("n", "<space>fb", function()
        require("telescope").extensions.file_browser.file_browser()
    end)
    end,
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
}
