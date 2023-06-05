local lsp = require("modules.languages.lsp")
local config = require("lspconfig")
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
            buildFlags = { "-tags=linux,darwin,unix" }, -- custom build flags
            gofumpt = true, -- A stricter gofmt
            codelenses = {
                gc_details = true, -- Toggle the calculation of gc annotations
                generate = true, -- Runs go generate for a given directory
                regenerate_cgo = true, -- Regenerates cgo definitions
                tidy = true, -- Runs go mod tidy for a module
                upgrade_dependency = true, -- Upgrades a dependency in the go.mod file for a module
                vendor = true, -- Runs go mod vendor for a module
            },
            diagnosticsDelay = "300ms",
            symbolMatcher = "fuzzy",
            completeUnimported = true,
            staticcheck = true,
            matcher = "Fuzzy",
            usePlaceholders = true, -- enables placeholders for function parameters or struct fields in completion responses
            analyses = {
                fieldalignment = false, -- find structs that would use less memory if their fields were sorted
                nilness = true, -- check for redundant or impossible nil comparisons
                shadow = true, -- check for possible unintended shadowing of variables
                unusedparams = true, -- check for unused parameters of functions
                unusedwrite = true, -- checks for unused writes, an instances of writes to struct fields and arrays that are never read
            },
        },
    },
}

-- https://github.com/williamboman/nvim-lsp-installer
M.lspserver = "gopls"

return M