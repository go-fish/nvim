local api = vim.api
local augroup = vim.api.nvim_exec

augroup(
    [[
augroup config
    autocmd!
    autocmd VimEnter * CHADopen --nofocus
    autocmd VimEnter * SymbolsOutlineOpen
    autocmd FileType CHADtree setlocal number relativenumber
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd BufWritePre *.go lua vim.lsp.buf.format({ async = true })
augroup END        
    ]],
    true
)