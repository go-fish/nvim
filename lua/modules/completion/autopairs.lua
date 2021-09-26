local M = {}

M.Object = {"windwp/nvim-autopairs"}

M.Setup = function()
    local apairs = require("nvim-autopairs")
   -- local cmp = require("nvim-autopairs.completion.cmp")

   -- cmp.setup({
   --     map_cr = true,
   --     map_complete = true,
   --     auto_select = true,
   -- })

    apairs.setup({
        fast_wrap = {},
        check_ts = true,
    })
end

return M
