local M = {}

M.Object = { "crusj/hierarchy-tree-go.nvim" }

M.Setup = function()
    require("hierarchy-tree-go").setup({
        icon = {
            fold = "", -- fold icon
            unfold = "", -- unfold icon
            func = "₣", -- symbol
            last = '☉', -- last level icon
        },
        hl = {
            current_module = "guifg=Green", -- highlight cwd module line
            others_module = "guifg=Black", -- highlight others module line
            cursorline = "guibg=Gray guifg=White" -- hl  window cursorline
        },
        keymap = {
            --global keymap
            incoming = "fi", -- call incoming under cursorword
            outgoing = "fo", -- call outgoing under cursorword
            -- focus: if hierarchy win is valid but is not current win, set to current win
            -- focus: if hierarchy win is valid and is current win, close
            -- focus  if hierarchy win not existing,open and focus
            focus = "fu",
    
            -- bufkeymap
            expand = "o", -- expand or collapse hierarchy
            jump = "<CR>", -- jump
            move = "<space><space>" -- switch the hierarchy window position, must be current win
        }
    })
end

return M