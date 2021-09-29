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
        handler_opts = {"double"}
    })

    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem.documentationFormat = {
    'markdown', 'plaintext'
}
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.preselectSupport = true
M.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
M.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
M.capabilities.textDocument.completion.completionItem.tagSupport = {
    valueSet = {1}
}
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}

return M
