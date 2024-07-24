local M = { "mvllow/modes.nvim", tag = 'v0.2.0' }

M.config = function ()
    require('modes').setup()
end

return M