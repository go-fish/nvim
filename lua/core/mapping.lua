local api = vim.api
local opts = { noremap = true, silent = true }
local M = {}

M.BindToBuffer = function(bufnr, mode, mapping, command)
   api.nvim_buf_set_keymap(0, mode, mapping, command, opts)
end

M.Bind = function(mode, mapping, command)
    api.nvim_set_keymap(mode, mapping, command, opts)
end

M.Load = function()
    -- ingore esc
    api.nvim_set_keymap("i", "<C-c>", "<ESC>", { noremap = true })
    api.nvim_set_keymap("n", "<Leader>d", ":bprevious <bar> bdelete #<CR>", { noremap = true })
end

return M
