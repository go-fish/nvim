local M = {}

M.Object = { "leoluz/nvim-dap-go" }

M.Setup = function()
    require("dap-go").setup()
end

return M