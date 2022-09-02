local M = {}

M.Object = { "rafamadriz/neon" }

M.Setup = function()
    vim.g.neon_style = "light"
    vim.g.neon_italic_keyword = true
    vim.g.neon_italic_function = true
    vim.g.neon_italic_variable = true
    vim.g.neon_italic_comment = true
    vim.g.neon_italic_boolean = true
    vim.g.neon_bold = true
    vim.g.neon_transparent = true
end

return M