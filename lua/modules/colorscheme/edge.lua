local M = {}

M.Object = { "sainnhe/edge" }

M.Setup = function()
    vim.g.edge_transparent_background = 1
    vim.g.edge_enable_italic = 1
    vim.g.edge_disable_italic_comment = 0
end

return M