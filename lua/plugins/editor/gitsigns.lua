local M = { "lewis6991/gitsigns.nvim" }

M.config = function()
    require('gitsigns').setup {
        signs = {
        add          = { text = '▌' },
          change       = { text = '▌' },
          delete       = { text = '▌' },
          topdelete    = { text = '▌' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged = {
          add          = { text = '▌' },
          change       = { text = '▌' },
          delete       = { text = '▌' },
          topdelete    = { text = '▌' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged_enable = true,
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          follow_files = true
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 200,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
      }

    vim.cmd('highlight GitSignsCurrentLineBlame guifg=#a89984 guibg=#282828')
    vim.keymap.set("n", "<leader>hb", "<cmd>lua require('gitsigns').blame()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>hd", "<cmd>lua require('gitsigns').diffthis()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>hD", "<cmd>lua require('gitsigns').diffthis('~')<CR>", { silent = true })
    vim.keymap.set("n", "<leader>hp", "<cmd>lua require('gitsigns').preview_hunk()<CR>", { silent = true })
end

return M
