-- all small plugins that doesn't require complex settings
return {
  {
    "svrana/neosolarized.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    config = function()
      require("neosolarized").setup({
        background_set = false,
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
          },
        },
      })
      vim.keymap.set("n", "<C-e>", ":Neotree<CR>")
    end,
  },
  "tpope/vim-fugitive",
  "gleam-lang/gleam.vim",
  "dstein64/vim-startuptime",
}
