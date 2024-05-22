return {
  "folke/trouble.nvim",
  branch = "dev",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({})
  end,
}
