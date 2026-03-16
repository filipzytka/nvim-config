require("config.lazy")

vim.cmd("let g:netrw_liststyle = 3")
vim.opt.clipboard:append("unnamedplus")
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 4 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.wrap = false
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
vim.opt.cursorline = true
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- key mappings
vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
vim.keymap.set("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })
-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set('n', "<C-h>", "<C-w>h" ,{noremap=true})
vim.keymap.set('n', "<C-j>", "<C-w>j" ,{noremap=true})
vim.keymap.set('n', "<C-k>", "<C-w>k" ,{noremap=true})
vim.keymap.set('n', "<C-l>", "<C-w>l" ,{noremap=true})

vim.keymap.set('n', '<leader>f', ':find ', { desc = "Find File" })
vim.keymap.set('n', '<leader>s', ':silent grep! <cword> | copen<CR>')
vim.keymap.set('n', ']q', ':cnext<CR>')
vim.keymap.set('n', '[q', ':cprev<CR>')

vim.opt.path:append("**")
vim.opt.wildmode = "longest:full,full"

-- grep
vim.opt.grepprg = "rg --vimgrep -uu"
vim.opt.grepformat = "%f:%l:%c:%m"

vim.keymap.set('n', '<leader>g', function()
    local search = vim.fn.input("Search for: ")
    
    if search ~= "" then
        vim.cmd("silent grep! " .. search)
        vim.cmd("copen")
        vim.cmd("redraw!")
    end
end)
