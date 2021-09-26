local M = {}

M.Object = {"lewis6991/gitsigns.nvim"}

M.Setup = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
        signs = {
            add = { hl = 'GitSignsAdd', text = '▌' },
            change = { hl = 'GitSignsChange', text = '▌' },
            delete = { hl = 'GitSignsDelete', text = '▌' },
            topdelete = { hl = 'GitSignsDelete', text = '‾' },
            changedelete = { hl = 'GitSignsChange', text = '~' },
        },
        watch_index = {interval = 1000, follow_files = true},
        current_line_blame = true,
        current_line_blame_opts = {delay = 500, virtual_text_pos = 'eol'},
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        word_diff = false,
        diff_opts = {internal = true}
    })
end

return M
