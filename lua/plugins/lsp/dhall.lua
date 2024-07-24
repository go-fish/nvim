local lsp = require("plugins.lsp.lsp")
local config = require("lspconfig")
local M = {}

M.Setup = function ()
    config.dhall_lsp_server.setup(lsp)
end

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

-- https://github.com/williamboman/nvim-lsp-installer
M.lspserver = "dhall-lsp"

return M
