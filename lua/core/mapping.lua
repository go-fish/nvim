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
    api.nvim_set_keymap("n", "k", "10k", {noremap = true})
    api.nvim_set_keymap("n", "j", "10j", {noremap = true})
    api.nvim_set_keymap("n", "gmt", "<cmd>!go mod tidy<CR>", { noremap = true })
    api.nvim_set_keymap("v", "cc", '"+y', { noremap = true })
    api.nvim_set_keymap("n", "fh", ":LspRestart<CR>", { noremap = true })
end

return M
