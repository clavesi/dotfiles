require("config.lazy")
require("config.keymaps")

vim.wo.number = true -- Absolute line numbers
vim.wo.relativenumber = true -- Relative line numbers
vim.wo.cursorline = true -- Highlight current line
vim.wo.wrap = true -- Line wrapping

vim.o.tabstop = 4 -- Tab width
vim.o.shiftwidth = 4 -- Indententation width
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.smartindent = true -- Smart indentation

vim.o.incsearch = true -- Hightlight search matches as you type
vim.o.hlsearch = true -- Highlight all instances of current search pattern

