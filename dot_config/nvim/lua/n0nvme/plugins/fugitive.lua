return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>p", function()
      vim.cmd.Git("pull --rebase")
    end, opts)
    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git("push")
    end, opts)
    vim.keymap.set("n", "<leader>G", function()
      vim.cmd.Git()
    end, opts)
  end,
}
