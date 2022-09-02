local M = {}

M.Object = {"NLKNguyen/papercolor-theme"}

M.Setup = function()
    vim.g.PaperColor_Theme_Options = {
        theme = {
            default = {
                transparent_background = 1,
                allow_italic = 1
            }
        }
    }
end

return M
