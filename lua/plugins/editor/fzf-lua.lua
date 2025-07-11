local M = {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" }
}

M.config = function ()
    require("fzf-lua").setup()

    -- mapping
    vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>fo", "<cmd>lua require('fzf-lua').oldfiles()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>fr", "<cmd>lua require('fzf-lua').lsp_references()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>fi", "<cmd>lua require('fzf-lua').lsp_implementations()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>fs", "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>fd", "<cmd>lua require('fzf-lua').lsp_document_diagnostics()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>fwd", "<cmd>lua require('fzf-lua').lsp_workspace_diagnostics()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>fa", "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>gb", "<cmd>lua require('fzf-lua').git_blame()<CR>", { silent = true })
end

return M