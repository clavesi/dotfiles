local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local pos = vim.api.nvim_win_get_cursor(0)
		vim.cmd([[%s/\s\+$//e]])
		vim.api.nvim_win_set_cursor(0, pos)
	end,
})

-- Resize splits when window is resized
autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Close certain filetypes with just q
autocmd("FileType", {
	pattern = { "help", "lspinfo", "mason", "lazy", "notify", "telescope" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf })
	end,
})

-- Auto close NvimTree if it's the last window
autocmd("BufEnter", {
	callback = function()
		local wins = vim.api.nvim_list_wins()
		if #wins == 1 then
			local buf = vim.api.nvim_win_get_buf(wins[1])
			if vim.bo[buf].filetype == "NvimTree" then
				vim.cmd("quit")
			end
		end
	end,
})

-- Restore cursor position when reopening a file
autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
