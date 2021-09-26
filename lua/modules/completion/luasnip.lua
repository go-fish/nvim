local M = {}

M.Object = {"L3MON4D3/LuaSnip"}

M.Setup = function()
    local luasnip = require("luasnip")
    local vscode = require("luasnip/loaders/from_vscode")
    
    luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI"
    }
    vscode.load()
end

return M