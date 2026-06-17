return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local map = vim.keymap.set
			map("n", "]h", gs.next_hunk, { buffer = bufnr })
			map("n", "[h", gs.prev_hunk, { buffer = bufnr })
			map("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr })
			map("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr })
			map("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
		end,
	},
}
