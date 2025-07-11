require("core.options")

-- loading mapping
require("core.mapping").Load()

-- add autocmd
require("core.autocmd")

-- setup lsp
require("core.lsp")


-- set colorscheme
vim.cmd [[set background=dark]]
vim.cmd [[colorscheme gruvbox]]
