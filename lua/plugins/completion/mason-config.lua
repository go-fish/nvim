local M = { "williamboman/mason-lspconfig.nvim" }

M.config = function ()
    require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer", "gopls", "helm_ls"},
    }
end

return M