return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "rust",
          "python",
          "yaml",
          "vimdoc",
          "javascript",
          "typescript",
          "markdown",
          "gleam",
        },

        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
  "nvim-treesitter/nvim-treesitter-context",
}
