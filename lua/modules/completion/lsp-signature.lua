local M = {}

M.Object = { "ray-x/lsp_signature.nvim" }

M.Setup = function()
    require("lsp_signature").setup({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        hint_enable = false,
        floating_window = false,
    })

    -- require("lsp_signature").status_line(max_width)
end

return M