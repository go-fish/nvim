local M = {}

M.Setup = function()
    require("mini.jump2d").setup({
        mappings = {
          start_jumping = 's',
        },
      })
end

return M
