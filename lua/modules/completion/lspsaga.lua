local M = {}

M.Object = { "glepnir/lspsaga.nvim", branch = "main" }

M.Setup = function()
    local mapping = require("core.mapping")
    local saga = require("lspsaga")

    saga.init_lsp_saga({
        finder_action_keys = {
            open = "gd",
        },
    })

    -- binding keymap
    mapping.Bind("n", "fr", "<cmd>Lspsaga lsp_finder<CR>")
    mapping.Bind("n", "fd", "<cmd>Lspsaga hover_doc<CR>")
    mapping.Bind("n", "fk", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    mapping.Bind("n", "fj", "<cmd>Lspsaga diagnostic_jump_next<CR>")
end

return M