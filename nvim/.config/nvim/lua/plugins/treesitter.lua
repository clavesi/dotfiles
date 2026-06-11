return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	opts = {
		ensure_installed = {
			"c",
			"cpp",
			"rust",
			"go",
			"python",
			"lua",
			"bash",
			"javascript",
			"typescript",
			"html",
			"css",
			"json",
			"yaml",
			"toml",
			"markdown",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)
	end,
}
