local M = { "stevearc/conform.nvim" }

M.config = function ()
    require("conform").setup({
        formatters_by_ft = {
          go = { "goimports"},
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 10000,
            lsp_fallback = true,
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
    })
end

return M