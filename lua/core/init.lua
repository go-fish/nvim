require("core.options")

-- loading mapping
require("core.mapping").Load()

-- add autocmd
require("core.autocmd")

-- install modules
require("modules")

vim.cmd [[set background=light]]
vim.cmd [[colorscheme onedarkpro]]
