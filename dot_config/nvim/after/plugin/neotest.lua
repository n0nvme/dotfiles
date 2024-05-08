require("neotest").setup({
  adapters = {
    require("neotest-python")({ 
      -- shitcode warning
      python = vim.fn.trim(vim.fn.system('poetry env info -p 2> /dev/null')) .. '/bin/python'
    })
  }
})

