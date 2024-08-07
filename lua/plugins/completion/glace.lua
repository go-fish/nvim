local M = { "dnlhc/glance.nvim" }

M.config = function ()
    require('glance').setup()

    vim.keymap.set('n', 'gd', '<CMD>Glance definitions<CR>')
    vim.keymap.set('n', 'gr', '<CMD>Glance references<CR>')
    vim.keymap.set('n', 'gt', '<CMD>Glance type_definitions<CR>')
    vim.keymap.set('n', 'gi', '<CMD>Glance implementations<CR>')
end

return M