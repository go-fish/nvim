local function load_options()
    local options = {
        sw = 4,
        ts = 4,
        et = true,
        smarttab = true,
        smartindent = true,
        smartcase = true,
        lbr = true,
        sm = true,
        selection = "inclusive",
        wildmenu = true,
        mousemodel = "popup",
        encoding = "utf-8",
        completeopt = 'menuone,noselect',

        -- font
        --guifont = "VictorMono Nerd Font:h18",

        -- viewer
        syntax = "on",
        termguicolors = true,
        foldenable = true, -- 允许折叠
        foldmethod = "expr", -- 手动折叠
        foldexpr = "nvim_treesitter#foldexpr()",
        foldlevel = 99,

        -- tab
        tabstop = 4, -- tab 宽度
        softtabstop = 4, -- 缩进
        shiftwidth = 4, -- 缩进
        expandtab = true, -- 空格代替tab
        autoindent = true, -- 自动缩进
        relativenumber = true, -- 显示行号
        history = 10000,
        -- 搜索逐字符高亮
        hlsearch = true,
        incsearch = true,
        -- 语言设置
        langmenu = "zh_CN.UTF-8",
        helplang = "cn",
        -- 显示状态栏
        cmdheight = 2,
        -- 文件类型
        filetype = "on",
        -- 自动载入新文件
        autoread = true,
        -- 在处理未保存或只读文件的时候，弹出确认
        confirm = true,
        -- 禁止生成swap文件
        backup = false,
        swapfile = false,
        -- 搜索忽略大小写
        ignorecase = true,

        linespace = 0,
        -- 使回格键（backspace）正常处理indent, eol, start等
       --- backspace = 2,
        fillchars = "vert: ,stl: ,stlnc: ",
        -- 高亮显示匹配括号
        showmatch = true,
        matchtime = 1,
        -- 取消自动换行
        wrap = true,

        -- buffer
        scrolloff = 128,

        laststatus = 3
    }

    for k, v in pairs(options) do
        vim.opt[k] = v
    end
end

load_options()

