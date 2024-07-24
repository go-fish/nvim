local M = {
    "andymass/vim-matchup",
    -- Highlight, jump between pairs like if..else
    lazy = true,
    event = { "User FileOpened" },
}

M.config = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
    lvim.builtin.treesitter.matchup.enable = true
end

return M