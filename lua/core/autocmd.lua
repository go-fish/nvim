local api = vim.api
local augroup = vim.api.nvim_exec

augroup(
    [[
augroup config
    autocmd!
    autocmd BufWritePost * :silent! lua vim.lsp.buf.formatting()
    autocmd InsertLeave * :silent! lua vim.lsp.buf.formatting()
    autocmd BufWritePost *.go lua require'core.function'.goimports(1000)
    autocmd VimEnter * CHADopen --nofocus
    autocmd FileType CHADtree setlocal number relativenumber
augroup END        
    ]],
    true
)
