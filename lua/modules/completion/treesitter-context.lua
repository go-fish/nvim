local M = {}

M.Object = {"romgrk/nvim-treesitter-context"}

M.Setup = function()
    local context = require("treesitter-context")

    context.setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
    })
end

return M
