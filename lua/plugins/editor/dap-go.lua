local M = { "leoluz/nvim-dap-go" }

M.config = function()
    require("dap-go").setup()
end

return M