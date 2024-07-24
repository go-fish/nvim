local M = {
    "folke/todo-comments.nvim",
    lazy = true,
    event = { "User FileOpened" },
}

M.config = function()
    require("todo-comments").setup()
end

return M