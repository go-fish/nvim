local M = { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

M.config = function()
    --  add custom parsers
    local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()

    parser_config.gotmpl = {
        install_info = {
            url = "https://github.com/ngalaiko/tree-sitter-go-template",
            files = {"src/parser.c"}
        },
        filetype = "gotmpl",
        used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl"}
    }

    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "go",
            "lua",
            "vim",
            "dhall",
            "gotmpl",
            "gomod",
            "gosum",
            "yaml"
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