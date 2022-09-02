local lsp = require("modules.languages.lsp")
local M = {}

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    settings = {
        yaml = {
           schemas = { kubernetes = "globPattern" },
        }
    },
}

-- https://github.com/williamboman/nvim-lsp-installer
M.lspserver = "yamlls"

return M
