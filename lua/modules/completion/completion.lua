local M = {}

M.Object = {"ms-jpq/coq_nvim", branch = "coq", run = ":COQdeps"}

M.Setup = function()
    vim.g.coq_settings = {
        auto_start =  true,
        keymap = {
            pre_select = false,
        },
        weights = {
            recency = 2,
        },
    }
end

return M

