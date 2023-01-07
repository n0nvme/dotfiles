vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.syntax = on

require("plugins")

vim.g.loadednetrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup()
require('keys')

