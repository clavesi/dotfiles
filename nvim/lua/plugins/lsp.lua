return {
    -- Mason plugin
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()  -- Initialize Mason
        end,
    },

    -- mason-lspconfig plugin
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },  -- Make sure mason is loaded first
        config = function()
            local servers = { }
            -- Set up mason-lspconfig to automatically install and configure LSP servers
            require("mason-lspconfig").setup({
                ensure_installed = servers,  -- List of LSP servers
                automatic_installation = true,    -- Automatically install missing LSP servers
            })

            -- Set up each LSP server
            for _, lsp in ipairs(servers) do
                require("lspconfig")[lsp].setup({})
            end
        end,
    },

    -- nvim-lspconfig plugin (this is required to configure LSP servers)
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Custom setup for lua_ls (Lua Language Server)
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                on_attach = function(client, bufnr)
                -- Define key mappings for LSP actions
                    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                end,
                capabilities = vim.lsp.protocol.make_client_capabilities(),
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT", -- or "Lua 5.1" or whatever version you're using
                            path = vim.split(package.path, ";"),
                        },
                        diagnostics = {
                            globals = { "vim" },  -- Define global variables to avoid warnings
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),  -- Automatically include runtime files
                        },
                        telemetry = {
                            enable = false,  -- Disable telemetry if not needed
                        },
                    },
                },
            })
        end
    },
}
