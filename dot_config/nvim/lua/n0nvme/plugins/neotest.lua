return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "mfussenegger/nvim-dap",
    "nvim-neotest/neotest-python",
    {
      "fredrikaverpil/neotest-golang",
      dependencies = {
        "leoluz/nvim-dap-go",
      },
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          -- shitcode warning
          python = vim.fn.trim(vim.fn.system("poetry env info -p 2> /dev/null")) .. "/bin/python",
        }),
        require("neotest-golang"),
      },
    })
    vim.keymap.set("n", "<leader>tt", function()
      require("neotest").summary.toggle()
    end)
    vim.keymap.set("n", "<leader>to", function()
      require("neotest").output_panel.toggle()
    end)
    vim.keymap.set("n", "<leader>tra", function()
      -- run all tests
      require("neotest").run.run(vim.fn.getcwd())
    end)
    vim.keymap.set("n", "<leader>tda", function()
      -- debug all tests
      require("neotest").run.run({ vim.fn.getcwd(), strategy = "dap" })
    end)
    vim.keymap.set("n", "<leader>tdn", function()
      -- debug nearest test
      require("neotest").run.run({ suite = false, strategy = "dap" })
    end)
  end,
}
