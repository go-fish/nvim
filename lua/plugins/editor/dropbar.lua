local M = { "Bekaboo/dropbar.nvim", dependencies = { "nvim-telescope/telescope-fzf-native.nvim" } }



  M.config = function()
    vim.ui.select = require('dropbar.utils.menu').select
    require("dropbar").setup()
  end

  return M