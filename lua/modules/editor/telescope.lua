local M = {}

M.Object = {"nvim-telescope/telescope.nvim"}

M.Setup = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local previewers = require("telescope.previewers")
    local Job = require("plenary.job")

    local new_maker = function(filepath, bufnr, opts)
        filepath = vim.fn.expand(filepath)
        Job
            :new({
                command = "file",
                args = { "--mime-type", "-b", filepath },
                on_exit = function(j)
                    local mime_type = vim.split(j:result()[1], "/")[1]
                    if mime_type == "text" then
                        previewers.buffer_previewer_maker(filepath, bufnr, opts)
                    else
                        -- maybe we want to write something to the buffer here
                        vim.schedule(function()
                            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                        end)
                    end
                end,
            })
            :sync()
    end

    telescope.setup({
        defaults = {
    
            mappings = { n = { ["q"] = actions.close } },
            prompt_prefix = " ",
    
            layout_config = {
                horizontal = { mirror = false, preview_width = 0.5 },
                vertical = { mirror = false },
            },
    
            file_ignore_patterns = { "node_modules", ".git" },
            set_env = { ["COLORTERM"] = "truecolor" },
            buffer_previewer_maker = new_maker,
        },
    })

    telescope.load_extension("fzf")

    -- set key map
    local mapping = require("core.mapping")

    mapping.Bind("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
    mapping.Bind("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>")
    mapping.Bind("n", "<Leader>fb", "<cmd>Telescope buffers<CR>")
    mapping.Bind("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>")

    -- lsp key
    mapping.Bind("n", "<Leader>fr", "<cmd>Telescope lsp_references<CR>")
    mapping.Bind("n", "<Leader>fs", "<cmd>Telescope lsp_document_symbols<CR>")
    mapping.Bind("n", "<Leader>fa", "<cmd>Telescope lsp_code_actions<CR>")
    mapping.Bind("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
    mapping.Bind("n", "<Leader>dd", "<cmd>Telescope lsp_workspace_diagnostics<CR>")
    mapping.Bind("n", "<C-p>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
    mapping.Bind("n", "<C-n>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")

    -- git key
    mapping.Bind("n", "<Leader>gs", "<cmd>Telescope git_status<CR>")
    mapping.Bind("n", "<Leader>gc", "<cmd>Telescope git_bcommits<CR>")
    mapping.Bind("n", "<Leader>gb", "<cmd>Telescope git_branches<CR>")
end

return M