local M = {}

M.Object = {"akinsho/toggleterm.nvim"}

M.Setup = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
        size = 10,
        open_mapping = [[<F5>]],
        shade_terminals = false,
        direction = 'float',
        float_opts = {
            border = 'curved',
            width = 250,
            winblend = 0,
        },
    })
end

return M