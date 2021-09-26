local M = {}

M.Object = {"ellisonleao/glow.nvim"}

M.Setup = function()
    local mapping = require("core.mapping")

    mapping.Bind("n", "<Leader>p", ":Glow<CR>")
end

return M