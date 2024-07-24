local M = { "utilyre/sentiment.nvim", event = "VeryLazy" }

M.config = function ()
    vim.g.loaded_matchparen = 1

    require("sentiment").setup()
end

return M