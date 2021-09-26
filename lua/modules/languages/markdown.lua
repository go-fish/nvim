local M = {}

M.Object = {"brymer-meneses/grammar-guard.nvim"}

M.Setup = function()
    local lspconfig = require("lspconfig")

    -- hook to lspconfig
    require("grammar-guard").init()

    -- add markdown grammar guard to lspconfig
    lspconfig.grammar_guard.setup({
        settings = {
            ltex = {
                enabled = { "latex", "tex", "bib", "markdown" },
                language = "en",
                diagnosticSeverity = "information",
                setenceCacheSize = 2000,
                additionalRules = {
                    enablePickyRules = true,
                    motherTongue = "en",
                },
                trace = { server = "verbose" },
                dictionary = {},
                disabledRules = {},
                hiddenFalsePositives = {},
            },
        },
    })
end

return M
