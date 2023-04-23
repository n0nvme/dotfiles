local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-e>', function() 
    require('nvim-tree').focus()
end)

vim.keymap.set('n', '<C-p>', builtin.find_files, {})

