local lsp = require("modules.languages.lsp")
local M = {}

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

-- https://github.com/williamboman/nvim-lsp-installer
M.lspserver = "sumneko_lua"

return M
