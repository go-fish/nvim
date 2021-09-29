local api = vim.api

local M = {}

M.on_attach = function(_, bufnr)
    local lspsignature = require("lsp_signature")

    lspsignature.on_attach({
        bind = true,
        use_lspsaga = false,
        floating_window = true,
        fix_pos = true,
        hint_enable = true,
        hi_parameter = "Search",
        handler_opts = {"shadow"}
    })

    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

return M
