local M = {}

M.Object = {"nvim-treesitter/nvim-treesitter"}

M.Setup = function()
    local tconfig = require("nvim-treesitter.configs")

    tconfig.setup({
        highlight = {
            enable = true,
            use_languagetree = true,
        },
    
        rainbow = {
            enable = true,
            extended_mode = true,
        },
    
        autotag = { enable = true },
    
        pairs = {
            enable = true,
            highlight_self = true,
            goto_right_end = false,
            fallback_cmd_normal = 'normal! %',
        },
    
        autopairs = { enable = true },
    
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
