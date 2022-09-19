local M = {}

M.Object = { "ray-x/navigator.lua", requires = {
    { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
    { "neovim/nvim-lspconfig" },
}}

M.Setup = function()
    local mapping = require("core.mapping")
    local reference = require("navigator.reference")

    require("navigator").setup({
        lsp_signature_help = true,
        lsp = {
            enable = true,
        },
    })

    mapping.Bind("n", "fr", ":lua require'navigator.reference'.async_ref()<CR>")
    mapping.Bind("n", "gd", ":lua require'navigator.definition'.definition()<CR>")
    mapping.Bind("n", "fd", ":lua require'navigator.definition'.definition_preview()<CR>")
    mapping.Bind("n", "fj", ":lua vim.diagnostic.goto_next()<CR>")
    mapping.Bind("n", "fk", ":lua vim.diagnostic.goto_next()<CR>")
    mapping.Bind("n", "fi", ":lua vim.lsp.buf.implementation()<CR>")
    mapping.Bind("n", "fl", ":lua require'navigator.diagnostics'.show_buf_diagnostics()<CR>")
end

return M