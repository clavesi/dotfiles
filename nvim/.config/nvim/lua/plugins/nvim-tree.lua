return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>" },
		{ "<leader>ef", "<cmd>NvimTreeFindFile<cr>" }, -- reveal current file
	},
	opts = {
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true, -- collapse single-child folders
			icons = {
				git_placement = "before",
			},
		},
		filters = {
			dotfiles = false, -- show hidden files
		},
		git = {
			enable = true,
		},
	},
}
