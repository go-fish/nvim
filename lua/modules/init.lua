local config_path = vim.fn.stdpath "config"
local data_path = vim.fn.stdpath "data"
local packer_path = data_path .. "/site/pack/packer/start/packer.nvim"
local package_root = data_path .. "/site/pack"
local plugins_path = config_path .. "/lua/modules/"
local compile_path = config_path .. "/lua/modules/packer_compile.lua"

-- list modules
local function list_modules()
    local list = {}
    local tmp = vim.split(vim.fn.globpath(plugins_path, "*/*.lua"), '\n')

    for _, f in pairs(tmp) do
        list[#list + 1] = f:sub(#config_path + 5, -1)
    end

    return list
end

-- load modules
local function load_modules()
    local modules = list_modules()

    packer.startup(function()
        for _, mod in pairs(modules) do
            local M = require(mod:sub(0, #mod - 4))
            if type(M) == "table" and M.Object ~= nil then
                packer.use(M.Object)
            end
        end
    end)
end

-- setup modules
local function setup_modules()
    local modules = list_modules()

    for _, mod in pairs(modules) do
        local M = require(mod:sub(0, #mod - 4))
        
        if type(M) == "table" and M.Setup ~= nil then
            M.Setup()
        end
    end
end

--- initialize packer.vim
local function ensure_packer()
    local state = vim.loop.fs_stat(packer_path)

    if not state then
        vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path }
        vim.cmd "packadd packer.nvim"
    end

    if not packer then
        packer = require("packer")
    end

    -- init packer
    packer.init({
        package_root = package_root,
        compile_path = compile_path,
        git = {clone_timeout = 120},
        --disable_commands = true
    })
    packer.reset()

    -- load all modules
    load_modules()

    -- install modules
    packer.install()

    -- setup modules
    setup_modules()

    -- recompile modules
    packer.compile()
end

ensure_packer()
