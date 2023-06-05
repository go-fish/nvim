local M = {}

M.Object = { "ms-jpq/coq_nvim", branch = "coq", run = ":COQdeps" }

M.Setup = function()
    vim.g.coq_settings = {
        auto_start =  true,
        clients = {
            lsp = {
                always_on_top = {},
            },
            tabnine = {
                enabled = false,
            },
        },
        keymap = {
            pre_select = false,
            jump_to_mark = "<S-tab>"
        },
        weights = {
            prefix_matches = 100,
        },
    }
end

return M

