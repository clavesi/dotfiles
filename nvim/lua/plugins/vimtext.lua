return {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtext_imaps_enabled = 0 -- disabled
        vim.g.vimtext_view_method = "latexmk"
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtext_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
        vim.g.vaimtext_quickfix_open_on_warning = 0 -- don't open quickfix if there are only warnings
        vim.g.vimtex_quickfix_ignore_filters = {"Underfull","Overfull", "LaTeX Warning: .\\+ float specifier changed to", "Package hyperref Warning: Token not allowed in a PDF string"}
    end
}
