local map = vim.keymap.set

-- Better esacpe
map("i", "jk", "<ESC>")

-- Save and quit
map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Move between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better indenting in visual mode (stays selected)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Split windows
map("n", "<leader>sv", "<cmd>vsplit<cr>")
map("n", "<leader>sh", "<cmd>split<cr>")
