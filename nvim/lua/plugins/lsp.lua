return {
    -- Mason plugin
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup() -- Initialize Mason
        end,
    },

    -- mason-lspconfig plugin
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" }, -- Make sure mason is loaded first
        config = function()
            local servers = { "lua_ls", "texlab" }
            -- Set up mason-lspconfig to automatically install and configure LSP servers
            require("mason-lspconfig").setup({
                ensure_installed = servers,    -- List of LSP servers
                automatic_installation = true, -- Automatically install missing LSP servers
            })
        end,
    },

    -- nvim-lspconfig plugin (this is required to configure LSP servers)
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }

            lspconfig.texlab.setup({})
        end
    },
}
