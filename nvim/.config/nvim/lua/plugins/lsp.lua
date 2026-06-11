return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"rust_analyzer",
				"gopls",
				"pyright",
				"ts_ls",
				"html",
				"cssls",
				"lua_ls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Native 0.12 API — no require("lspconfig") needed
			vim.lsp.config("clangd", {})
			vim.lsp.config("rust_analyzer", {})
			vim.lsp.config("gopls", {})
			vim.lsp.config("pyright", {})
			vim.lsp.config("ts_ls", {})
			vim.lsp.config("html", {})
			vim.lsp.config("cssls", {})
			vim.lsp.config("lua_ls", {})

			-- Enable all configured servers
			vim.lsp.enable({
				"clangd",
				"rust_analyzer",
				"gopls",
				"pyright",
				"ts_ls",
				"html",
				"cssls",
				"lua_ls",
			})

			-- Keymaps on attach
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local map = vim.keymap.set
					local opts = { buffer = args.buf }
					map("n", "gd", vim.lsp.buf.definition, opts)
					map("n", "gr", vim.lsp.buf.references, opts)
					map("n", "K", vim.lsp.buf.hover, opts)
					map("n", "<leader>rn", vim.lsp.buf.rename, opts)
					map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					map("n", "<leader>d", vim.diagnostic.open_float, opts)
					map("n", "[d", vim.diagnostic.goto_prev, opts)
					map("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})
		end,
	},
}
