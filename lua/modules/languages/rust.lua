local lsp = require("modules.languages.lsp")
local config = require("lspconfig")
-- local coq = require("coq")
local M = {}

M.Setup = function()
end

-- M.lsp = coq.lsp_ensure_capabilities {
M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    -- cmd = { "gopls", "serve" },
    settings = {
        rust_analyzer = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        },
    },
}

-- https://github.com/williamboman/nvim-lsp-installer
M.lspserver = "rust_analyzer"

return M
