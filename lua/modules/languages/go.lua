local lsp = require("modules.languages.lsp")
local coq = require("coq")
local M = {}

M.Setup = function()
    -- key map
    local mapping = require("core.mapping")

    mapping.Bind("n", "<C-g>", "<cmd>!gocmt -i -d %:p<CR>")
    mapping.Bind("n", "<C-v>", "<cmd>!gotests -exported -w %:p<CR>")
end

M.lsp = coq.lsp_ensure_capabilities {
    capabilities = lsp.capabilities,
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
        },
        staticcheck = true,
    },
    on_attach = lsp.on_attach,
}

return M
