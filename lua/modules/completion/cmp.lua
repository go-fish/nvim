local fn = vim.fn
local lspKindIcons = require("core.theme").lspKindIcons
local M = {}

M.Object = {"hrsh7th/nvim-cmp"}

M.Setup = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    vim.o.completeopt = 'menuone,noselect'

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
            },
            ['<Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
                fallback()
            end
            end,
            ['<S-Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
            elseif luasnip.jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
            else
                fallback()
            end
            end,
        },
        formatting = {
            format = function(_, vim_item)
                vim_item.kind = lspKindIcons[vim_item.kind]
                return vim_item
            end,
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        },
    })
end

return M
