local M = {}

M.Object = {"ray-x/lsp_signature.nvim"}

M.Setup = function()
    local signature = require("lsp_signature")

    signature.setup({
        handler_opt = {
            border = "none",
        },
        floating_window_above_first = true,
        hint_prefix = ' ',
        zindex = 50,
    })
end

return M