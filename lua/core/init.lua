local vim = vim

local function load_core()
    require("core.options")

    -- load mapping
    require("core.mapping").Load()

    -- load modules
    require("modules")
    
    -- set autocmd
    require("core.autocmd")

    -- set colorscheme
    --vim.cmd [[colorscheme gruvbox-material]]
    vim.cmd [[set background=light]]
    --vim.g.edge_style = "aura"
    vim.g.edge_enable_italic = 1
    vim.g.edge_disable_italic_comment = 0
    vim.g.edge_show_eob = 1
    vim.g.edge_better_performance = 1
    vim.g.edge_transparent_background = 1

    vim.cmd [[colorscheme PaperColor]]
end

load_core()
