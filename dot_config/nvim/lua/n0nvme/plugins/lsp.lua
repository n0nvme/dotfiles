return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "gleam-lang/gleam.vim",
  },
  config = function()
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "gi", function()
      vim.lsp.buf.implementation()
    end, opts)
    vim.keymap.set("n", "gr", function()
      vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>vws", function()
      vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", "<leader>vd", function()
      vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("v", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>vrn", function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts)

    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_enable = true,
      ensure_installed = {
        "ruff",
        "ty",
        "gopls",
        "ansiblels",
        "svelte",
        "markdown_oxide",
        "basedpyright",
        --"omnisharp",
        "csharp_ls",
        -- "jq_lsp",
      },
    })

    local python_utils = require("functions.python")
    local python_path = python_utils.get_python_path()
    vim.lsp.config("basedpyright", {
      settings = {
        python = {
          pythonPath = python_path,
        },
        basedpyright = {
          analysis = {
            diagnosticMode = "workspace",
            typeCheckingMode = "strict",
          },
        },
      },
    })
    vim.lsp.config("ty", {
      settings = {
        ty = {
          -- https://github.com/astral-sh/ty/issues/2032
          -- interpreter = python_path,
          inlayHints = {
            variableTypes = true,
            callArgumentNames = true,
          },
          completions = {
            autoImport = true,
          },
          disableLanguageServices = true,
        },
      },
    })
    vim.lsp.config("ruff", {
      settings = {
        ruff = {
          configurationPreference = "filesystemFirst",
        },
      },
    })
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    vim.lsp.config("markdown_oxide", {
      capabilities = vim.tbl_deep_extend("force", capabilities, {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      }),
    })
    vim.lsp.enable("gleam")
  end,
}
