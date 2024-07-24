local M = {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "ibhagwan/fzf-lua",              -- optional
    }
}

M.config = function ()
    require("neogit").setup()
    
    vim.keymap.set("n", "fg", "<cmd>lua require('neogit').open({ kind ='auto'})<CR>", { silent = true })
end

return M