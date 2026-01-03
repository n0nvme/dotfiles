return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },
  opts = {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_cursor({}),
      },
    },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_cursor({}),
        },
      },
    })
    require("telescope").load_extension("fzf")
    --require("telescope.builtin").lsp_code_actions(require("telescope.themes").get_cursor())
    require("telescope").load_extension("ui-select")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fp", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>fc", builtin.commands, {})
    vim.keymap.set("n", "<leader>fq", builtin.quickfix, {})
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
  end,
}
