return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"html",
				"css",
				"python",
				"cpp",
			},
			sync_install = false,
			highlight = {
				enable = true, -- Syntax highlighting
				additional_vim_regex_highlighting = false, -- Disable legacy regex-based highlighting
			},
			indent = { enable = true }, -- Treesitter-based indentation
		})
	end
}
