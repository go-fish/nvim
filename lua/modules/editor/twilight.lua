local M = {}

M.Object = {"folke/twilight.nvim"}

M.Setup = function()
    local twilight = require("twilight")

    twilight.setup()
end

return M
