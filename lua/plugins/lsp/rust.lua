local lsp = require("plugins.lsp.lsp")
local config = require("lspconfig")
local M = {}

M.Setup = function()
    config.rust_analyzer.setup(lsp)
end

-- M.lsp = coq.lsp_ensure_capabilities {
M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
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
