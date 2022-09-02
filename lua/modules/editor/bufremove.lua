local api = vim.api
local M = {}

M.Setup = function()
    require("mini.bufremove").setup()

    -- add mapping
    api.nvim_set_keymap("n", "<Leader>d", ":lua require('mini.bufremove').delete()<CR>",  { noremap = true })
end

return M
