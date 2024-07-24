local M = {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" }
}

M.config = function ()
    require("fzf-lua").setup()

    -- mapping
    vim.keymap.set("n", "ff", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
    vim.keymap.set("n", "fhf", "<cmd>lua require('fzf-lua').oldfiles()<CR>", { silent = true })
    vim.keymap.set("n", "fr", "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true })
    vim.keymap.set("n", "fgb", "<cmd>lua require('fzf-lua').git_branches()<CR>", { silent = true })
    vim.keymap.set("n", "fgs", "<cmd>lua require('fzf-lua').git_status()<CR>", { silent = true })
    vim.keymap.set("n", "fgl", "<cmd>lua require('fzf-lua').git_commits()<CR>", { silent = true })
    vim.keymap.set("n", "fdp", "<cmd>lua require('fzf-lua').dap_breakpoints()<CR>", { silent = true })
end

return M