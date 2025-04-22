local builtin = require("telescope.builtin")

vim.g.mapleader = " "
vim.g.localleader = "\\"

-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
-- Quit Neovim
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit Neovim" })
-- Save and Quit
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and Quit" })
-- Force Quit (without saving)
vim.keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Force Quit (discard changes)" })
-- Format Document
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format Document" })

-- Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent Files" })
vim.keymap.set("n", "<leader>fs", builtin.git_status, { desc = "Git Status" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find Commands" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })

-- Neovim LSP
vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "Go to Definition" })
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "Find References" })
vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, { desc = "Find Implementations" })
vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Document Symbols" })
vim.keymap.set("n", "<leader>lw", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })
vim.keymap.set("n", "<leader>le", builtin.diagnostics, { desc = "Show Diagnostics" })
vim.keymap.set("n", "<leader>ltd", builtin.lsp_type_definitions, { desc = "Type Definitions" })

-- Neo-Tree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- VimTex
vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>", { desc = "Compile Latex" })
vim.keymap.set("n", "<leader>lq", ":VimtexStop<CR>", { desc = "Stop LaTeX Compilation" })
vim.keymap.set("n", "<leader>lp", ":VimtexViewer<CR>", { desc = "Open PDF Viewer" })
