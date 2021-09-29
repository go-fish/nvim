local M = {}

M.Object = {"kabouzeid/nvim-lspinstall"}

M.Setup = function()
    local lspinstall = require("lspinstall")
    local lspconfig = require("lspconfig")
    local servers = {"go", "lua", "bash", "yaml", "json"}

    local function install_servers()
        local installed_servers = lspinstall.installed_servers()

        for _, s in pairs(servers) do
            local installed = false

            for _, is in pairs(installed_servers) do
                if s == is then
                    installed = true
                    break
                end
            end

            if not installed  then
                lspinstall.install_server(s)
            end
        end
    end

    local function setup_servers()
        lspinstall.setup()
        
        local installed_servers = lspinstall.installed_servers()

        for _, server in pairs(installed_servers) do
            local config_path = vim.fn.stdpath "config"
            local server_path = config_path .. "/lua/modules/languages/" .. server .. ".lua"
            local state = vim.loop.fs_stat(server_path)

            if state then
                local m = require("modules.languages." ..server)

                if type(m) == "table" and m.lsp ~= nil then
                    lspconfig[server].setup{m.lsp}
                else
                    lspconfig[server].setup{}
                end

                -- install treesitter
                local installer = require("nvim-treesitter.install")
                local parser = require("nvim-treesitter.parsers")

                if not parser.has_parser(server) then
                    installer.commands.TSInstall["run!"](server)
                end
            end
        end
    end

    install_servers()
    setup_servers()

    lspinstall.post_install_hook = function ()
        setup_servers() -- reload installed servers
        vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
    end
end

return M
