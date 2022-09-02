local M = {}

M.Object = {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

M.Setup = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "go",
            "lua",
            "vim",
        },

        highlight = {
            enable = true,
            use_languagetree = true,
        },

        incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = '<CR>',
              node_incremental = '<CR>',
              node_decremental = '<BS>',
              scope_incremental = '<TAB>',
            }
        },

        indent = {
            enable = true
        },
        
        textObjects = {
            move = {
                enable = true,
                set_jumps = true,
    
                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
    
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer',
                },
    
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
    
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
            },
    
            lsp_interop = {
                enable = true,
                border = 'none',
                peek_definition_code = {
                    ['df'] = '@function.outer',
                    ['dF'] = '@class.outer',
                },
            },
        },
    })
end

return M
