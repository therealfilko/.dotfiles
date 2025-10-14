return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    -- capabilities for nvim-cmp
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- gutter signs
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local default_opts = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    vim.lsp.config("html", default_opts)
    vim.lsp.config("gopls", default_opts)
    vim.lsp.config("clangd", default_opts)
    vim.lsp.config("ts_ls", default_opts)
    vim.lsp.config("pyright", default_opts)
    vim.lsp.config("ruff", default_opts)
    vim.lsp.config("cssls", default_opts)
    vim.lsp.config("marksman", default_opts)
    vim.lsp.config("templ", default_opts)

    -- Tailwind CSS (mit deinen Settings)
    vim.lsp.config("tailwindcss", vim.tbl_deep_extend("force", default_opts, {
      settings = {
        tailwindCSS = {
          validate = true,
          lint = {
            cssConflict = "warning",
            invalidApply = "error",
            invalidConfigPath = "error",
            invalidScreen = "error",
            invalidTailwindDirective = "error",
            invalidVariant = "error",
            recommendedVariantOrder = "warning",
          },
          experimental = {
            classRegex = {
              'tw`([^`]*)',
              'tw="([^"]*)',
              'tw={"([^"}]*)',
              'tw\\.([^\\s\'"]*)',
              'tw\\(.*?\\)',
            },
          },
        },
      },
    }))

    -- Lua (lua_ls)
    vim.lsp.config("lua_ls", vim.tbl_deep_extend("force", default_opts, {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    }))

    vim.lsp.enable("html")
    vim.lsp.enable("gopls")
    vim.lsp.enable("clangd")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("pyright")
    vim.lsp.enable("ruff")
    vim.lsp.enable("cssls")
    vim.lsp.enable("marksman")
    vim.lsp.enable("templ")
    vim.lsp.enable("tailwindcss")
    vim.lsp.enable("lua_ls")
  end,
}

