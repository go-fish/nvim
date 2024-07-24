local config_path = vim.fn.stdpath "config"
local lsp_Path = config_path .. "/lua/plugins/lsp/"

local function setup()
    local tmp = vim.split(vim.fn.globpath(lsp_Path, "*.lua"), '\n')

    for _, f in pairs(tmp) do
        local mod = f:sub(#config_path + 5, -1)
        local server = require(mod:sub(0, #mod - 4))

        if type(server) == "table" and server.lspserver ~= nil and server.Setup ~= nil then
            server.Setup()
        end
    end
end

setup()