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

-- neotest
vim.keymap.set('n', '<leader>tt', function()
    require("neotest").summary.toggle()
end)
vim.keymap.set('n', '<leader>to', function()
    require("neotest").output_panel.toggle()
end)
vim.keymap.set('n', '<leader>tra', function()
    -- run all tests
    require("neotest").run.run(vim.fn.getcwd())
end)
vim.keymap.set('n', '<leader>tda', function()
    -- debug all tests
    require("neotest").run.run({ vim.fn.getcwd(), strategy = "dap"})
end)
