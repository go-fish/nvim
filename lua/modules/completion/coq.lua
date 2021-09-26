local M = {}

M.Object = {"ms-jpq/coq_nvim", branch = "coq"}

M.Setup = function()
    vim.cmd('COQnow -s')
end

return M
