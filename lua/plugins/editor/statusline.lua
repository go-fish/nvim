local M = { "windwp/windline.nvim" }

M.config = function()
    local windline = require('windline')
    local helper = require('windline.helpers')
    local b_components = require('windline.components.basic')
    local state = _G.WindLine.state
    local lsp_comps = require('windline.components.lsp')
    local git_comps = require('windline.components.git')

    local hl_list = {
        Black = { 'white', 'black' },
        White = { 'black', 'white' },
        Inactive = { 'InactiveFg', 'InactiveBg' },
        Active = { 'ActiveFg', 'ActiveBg' },
    }

    local current_signature = function(width)
        if not pcall(require, 'lsp_signature') then return end
        local sig = require("lsp_signature").status_line(width)
        return "🐼  " .. sig.label
    end

    local basic = {}
    
    local breakpoint_width = 90
    basic.divider = { b_components.divider, '' }
    basic.bg = { ' ', 'StatusLine' }
    
    local colors_mode = {
        Normal = { 'red', 'black' },
        Insert = { 'green', 'black' },
        Visual = { 'yellow', 'black' },
        Replace = { 'blue_light', 'black' },
        Command = { 'magenta', 'black' },
    }
    
    basic.vi_mode = {
        name = 'vi_mode',
        hl_colors = colors_mode,
        text = function()
            return { { '   ', state.mode[2] } }
        end,
    }
    
    basic.square_mode = {
        hl_colors = colors_mode,
        text = function()
            return { { '▊ ', state.mode[2] } }
        end,
    }
    
    basic.lsp_diagnos = {
        name = 'diagnostic',
        hl_colors = {
            red = { 'red', 'black' },
            yellow = { 'yellow', 'black' },
            blue = { 'blue', 'black' },
        },
        width = breakpoint_width,
        text = function(bufnr)
            if lsp_comps.check_lsp(bufnr) then
                return {
                    { lsp_comps.lsp_error({ format = '   %s', show_zero = true }), 'red' },
                    { lsp_comps.lsp_warning({ format = '   %s', show_zero = true }), 'yellow' },
                    { lsp_comps.lsp_hint({ format = ' 󰢌  %s ', show_zero = true }), 'blue' },
                }
            end
            return ''
        end,
    }

    local relativePath = function()
        local p = vim.fn.getcwd() .. '/'
        local s = vim.api.nvim_buf_get_name(0)
        return (s:sub(0, #p) == p) and s:sub(#p+1) or s
    end

    basic.file = {
        name = 'file',
        hl_colors = {
            default = hl_list.Black,
            white = { 'white', 'black' },
            magenta = { 'magenta', 'black' },
        },
        text = function(_, _, width)
            if width > breakpoint_width then
                return {
                    { b_components.cache_file_size(), 'default' },
                    { ' ', '' },
                    { relativePath(), 'magenta' },
                    { b_components.line_col_lua, 'white' },
                    { b_components.progress_lua, '' },
                    { ' ', '' },
                    { b_components.file_modified('  '), 'magenta' },
                }
            else
                return {
                    { b_components.cache_file_size(), 'default' },
                    { ' ', '' },
                    { relativePath(), 'magenta' },
                    { ' ', '' },
                    { b_components.file_modified('  '), 'magenta' },
                }
            end
        end,
    }

    basic.file_right = {
        hl_colors = {
            default = hl_list.Black,
            white = { 'white', 'black' },
            magenta = { 'magenta', 'black' },
        },
        text = function(_, _, width)
            if width < breakpoint_width then
                return {
                    { b_components.line_col_lua, 'white' },
                    { b_components.progress_lua, '' },
                }
            end
        end,
    }

    basic.git = {
        name = 'git',
        hl_colors = {
            green = { 'green', 'black' },
            red = { 'red', 'black' },
            blue = { 'blue', 'black' },
        },
        width = breakpoint_width,
        text = function(bufnr)
            if git_comps.is_git(bufnr) then
                return {
                    { git_comps.diff_added({ format = '   %s', show_zero = true }), 'green' },
                    { git_comps.diff_removed({ format = '   %s', show_zero = true }), 'red' },
                    { git_comps.diff_changed({ format = '   %s', show_zero = true }), 'blue' },
                }
            end
            return ''
        end,
    }

    basic.lsp_name = {
        width = breakpoint_width,
        name = 'lsp_name',
        hl_colors = {
            magenta = { 'magenta', 'black' },
        },
        text = function(bufnr)
            if lsp_comps.check_lsp(bufnr) then
                return {
                    { lsp_comps.lsp_name(), 'magenta' },
                }
            end
            return {
                { b_components.cache_file_type({icon = true}), 'magenta' },
            }
        end,
    }

    basic.signature = {
        name = "signature",
        hl_colors = {
          megenta = { "magenta", "black" },
        },
        text = function(_, winnr, width, is_float)
          return { { " ", "default" }, { current_signature(width), "megenta" }, { " ", "default" } }
        end,
    }
    
    local default = {
        filetypes = { 'default' },
        active = {
            basic.square_mode,
            basic.vi_mode,
            basic.file,
            basic.lsp_diagnos,
            basic.signature,
            basic.divider,
            basic.file_right,
            basic.lsp_name,
            basic.git,
            { git_comps.git_branch(), { 'magenta', 'black' }, breakpoint_width },
            { ' ', hl_list.Black },
            basic.square_mode,
        },
        inactive = {
            { b_components.full_file_name, hl_list.Inactive },
            basic.file_name_inactive,
            basic.divider,
            basic.divider,
            { b_components.line_col, hl_list.Inactive },
            { b_components.progress, hl_list.Inactive },
        },
    }
    
    windline.setup({
        colors_name = function(colors)
            -- print(vim.inspect(colors))
            -- ADD MORE COLOR HERE ----
            return colors
        end,
        statuslines = {
            default,
        },
    })
end

return M
