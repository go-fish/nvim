local lsp = require("modules.languages.lsp")
-- local coq = require("coq")
local M = {}

M.Setup = function()
    -- key map
    local mapping = require("core.mapping")

    mapping.Bind("n", "<C-g>", "<cmd>!gocmt -i -d %:p<CR>")
    mapping.Bind("n", "<C-h>", "<cmd>!gotests -exported -w %:p<CR>")
end

-- M.lsp = coq.lsp_ensure_capabilities {
M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    -- cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
                fieldalignment = true,
                shadow = true,
            },
            experimentalPostfixCompletions = true,
            gofumpt = true,
            staticcheck = true,
            usePlaceholders = false,
            completeUnimported = true,
        },
    },
}

-- https://github.com/williamboman/nvim-lsp-installer
M.lspserver = "gopls"

return M