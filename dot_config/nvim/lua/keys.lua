vim.g.mapleader = " "

-- nvim-tree
vim.keymap.set('n', '<C-e>', function() 
    require('nvim-tree.api').tree.focus()
end)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

