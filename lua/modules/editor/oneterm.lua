local M = {}

M.Object = { "LoricAndre/OneTerm.nvim" }

M.Setup = function()
    -- mapping
    local mapping = require("core.mapping")

    -- open terminal
    mapping.Bind("n", "ft", ":OneTerm term<CR>")
    mapping.Bind("t", "<C-d>", "<C-\\><C-n>")

    -- search files
    mapping.Bind("n", "ff", ":OneTerm files<CR>")

    -- search lines
    mapping.Bind("n", "fg", ":OneTerm rg<CR>")
end

return M
