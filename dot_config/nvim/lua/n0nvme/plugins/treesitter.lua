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
          "hyprlang",
          "helm",
          "gotmpl",
        },

        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
      vim.filetype.add({
        pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
      })
      vim.filetype.add({
        extension = {
          gotmpl = "gotmpl",
          gotmplhtml = "gotmpl",
        },
        pattern = {
          [".*/templates/.*%.tpl"] = "helm",
          [".*/templates/.*%.tmpl.html"] = "helm",
          [".*/templates/.*%.ya?ml"] = "helm",
        },
      })
    end,
  },
}
