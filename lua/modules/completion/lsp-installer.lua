local M = {}
local config_path = vim.fn.stdpath "config"
local lua_path = config_path .. "/lua/"
local language_path = config_path .. "/lua/modules/languages/"

M.Object = { "williamboman/nvim-lsp-installer" }

M.Setup = function()
    local installer = require("nvim-lsp-installer")
    local servers = require("nvim-lsp-installer.servers")
    local lspconfig = require("lspconfig") 
    local coq = require("coq")

    local function listExpectedServers()
        local list = {}
        local tmp = vim.split(vim.fn.globpath(language_path, "*.lua"), '\n')

        for _, f in pairs(tmp) do
            local mod = f:sub(#config_path + 5, -1)
            local server = require(mod:sub(0, #mod - 4))

            if type(server) == "table" and server.lspserver ~= nil then
                list[#list + 1] = {lspserver = server.lspserver, setup = server.lsp}
            end
        end

        return list
    end

    local function installServers(expectedServers)
        for _, f in pairs(expectedServers) do
            local server_available, requested_server = servers.get_server(f.lspserver)
            if server_available then
                requested_server:on_ready(function ()
                    local opts = f.setup or coq.lsp_ensure_capabilities {}
                    requested_server:setup(opts)
                end)
                if not requested_server:is_installed() then
                    -- Queue the server to be installed
                    requested_server:install()
                end
            else
                print(vim.inspect("unsupported lanaguage " .. f))
            end
        end
    end

    installServers(listExpectedServers())
end

return M
