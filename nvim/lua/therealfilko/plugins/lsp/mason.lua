-- nvim/lua/therealfilko/plugins/mason.lua
return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        require("mason-lspconfig").setup({
            ensure_installed = {
                "ts_ls",
                "html",
                "cssls",
                "tailwindcss",
                "lua_ls",
                "gopls",
                "ruff", 
            },
            automatic_installation = true,
        })
        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "eslint_d",
                "mypy",
                "pyright",
                "ruff",
            },
        })
    end,
}
