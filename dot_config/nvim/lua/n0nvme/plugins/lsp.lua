return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
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
      vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "<leader>vca", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>gr", function()
      vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "<leader>vrn", function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts)

    local util = require("lspconfig/util")
    local path = util.path

    -- source https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-877293306
    local function get_python_path(workspace)
      -- Use activated virtualenv.
      if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
      end

      -- Find and use virtualenv via poetry in workspace directory.
      local match = vim.fn.glob(path.join(workspace, "poetry.lock"))
      if match ~= "" then
        local venv = vim.fn.trim(vim.fn.system("poetry env info -p 2> /dev/null"))
        return path.join(venv, "bin", "python")
      end

      -- Fallback to system Python.
      return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
    end
    -- print("fuck it all!!")

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright", "gopls", "ansiblels" },
      handlers = {
        gopls = function()
          require("lspconfig").gopls.setup({})
        end,
        pyright = function()
          require("lspconfig").pyright.setup({
            before_init = function(_, config)
              config.settings.python.pythonPath = get_python_path(config.root_dir)
            end,
          })
        end,
        ansiblels = function()
          require("lspconfig").ansiblels.setup({})
        end,
      },
    })
    require("lspconfig").gleam.setup({})
  end,
}
