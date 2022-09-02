local M = {}

M.Object = { "j-hui/fidget.nvim" }

M.Setup = function()
    require("fidget").setup({
        window = {
            blend = 0,
        },
    })
end

return M