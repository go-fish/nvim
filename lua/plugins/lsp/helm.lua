local lsp = require("plugins.lsp.lsp")
local config = require("lspconfig")
local util = require('lspconfig.util')
local M = {}

M.Setup = function ()
    config.helm_ls.setup({
        cmd = {"helm_ls", "serve"},
        filetypes = {'helm'},
        root_dir = function(fname)
          return util.root_pattern('Chart.yaml')(fname)
        end,
      })
end

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

-- https://github.com/williamboman/nvim-lsp-installer
M.lspserver = "helm_ls"

return M
