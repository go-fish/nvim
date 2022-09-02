local M = {}

M.Object = { "crusj/structrue-go.nvim", branch = "main" }

M.Setup = function()
    require("structrue-go").setup()
end

return M