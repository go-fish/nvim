local M = {}

M.Object = { "olimorris/onedarkpro.nvim" }

M.Setup = function() 
    require("onedarkpro").setup({
        styles = { -- Choose from "bold,italic,underline"
            strings = "italic", -- Style that is applied to strings.
            comments = "italic", -- Style that is applied to comments
            keywords = "italic", -- Style that is applied to keywords
            functions = "italic", -- Style that is applied to functions
            variables = "italic", -- Style that is applied to variables
            virtual_text = "italic", -- Style that is applied to virtual text
        },
        options = {
            bold = true, -- Use the colorscheme's opinionated bold styles?
            italic = true, -- Use the colorscheme's opinionated italic styles?
            underline = false, -- Use the colorscheme's opinionated underline styles?
            undercurl = true, -- Use the colorscheme's opinionated undercurl styles?
            cursorline = true, -- Use cursorline highlighting?
            transparency = true, -- Use a transparent background?
            terminal_colors = false, -- Use the colorscheme's colors for Neovim's :terminal?
            window_unfocused_color = true, -- When the window is out of focus, change the normal background?
        }
    })
end

return M