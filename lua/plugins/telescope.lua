return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local trouble = require("trouble")
        local actions = require("telescope.actions")
        local trouble_telescope = require("trouble.sources.telescope")
        local transform_mod = require("telescope.actions.mt").transform_mod

        local custom_actions = transform_mod({
          open_trouble_qflist = function(prompt_bufnr)
            trouble.toggle("quickfix")
          end,
        })

        telescope.setup({
          defaults = {
            path_display = { "smart" },
            mappings = {
              i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                ["<C-t>"] = trouble_telescope.open,
              },
            },
          },
          pickers = {
            find_files = {
              hidden = true,
              no_ignore = true,
            },
            live_grep = {
              additional_args = function()
                return { "--hidden", "--no-ignore" }
              end,
            },
          },
        })

        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })

    end,
}
