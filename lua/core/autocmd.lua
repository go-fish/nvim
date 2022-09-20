local api = vim.api
local augroup = vim.api.nvim_exec

augroup(
    [[
augroup config
    autocmd!
    autocmd BufWritePre * :silent! lua vim.lsp.buf.formatting()
    autocmd InsertLeave * :silent! lua vim.lsp.buf.formatting()
    autocmd BufWritePre *.go lua require'core.function'.goimports(1000)
    autocmd VimEnter * CHADopen --nofocus
    autocmd FileType CHADtree setlocal number relativenumber
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
augroup END        
    ]],
    true
)
