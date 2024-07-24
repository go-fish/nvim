local lsp = require("plugins.lsp.lsp")
local config = require("lspconfig")
local M = {}

M.Setup = function ()
    config.yamlls.setup(lsp)
end

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

-- https://github.com/williamboman/nvim-lsp-installer
M.lspserver = "yamlls"

return M
