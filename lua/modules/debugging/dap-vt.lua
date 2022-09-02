local M = {}

M.Object = { "theHamsta/nvim-dap-virtual-text" }

M.Setup = function()
    require("nvim-dap-virtual-text").setup()
end

return M