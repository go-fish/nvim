local api = vim.api
local augroup = vim.api.nvim_exec

augroup(
    [[
augroup config
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.formatting()
    autocmd InsertLeave * lua vim.lsp.buf.formatting()
    autocmd VimEnter * CHADopen --nofocus
    autocmd FileType CHADtree setlocal number relativenumber
augroup END        
    ]],
    true
)
