local M = {}

M.Object = { "Pocco81/dap-buddy.nvim", branch = "dev" }

M.Setup = function()
    require("dap-install").config("go-delve", {})
end

return M