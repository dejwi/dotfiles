vim.o.expandtab = false

vim.keymap.set('n', '<leader>gn', function()
  Snacks.picker.grep({ dirs = { "/Users/user/work/respo/apps/native/" } })
end, { desc = "Grep respo - native" })

vim.keymap.set('n', '<leader>gff', function()
  Snacks.picker.grep({ dirs = { "/Users/user/work/respo/apps/form/" } })
end, { desc = "Grep respo - form" })

vim.keymap.set('n', '<leader>gfk', function()
  Snacks.picker.grep({ dirs = { "/Users/user/work/respo/apps/form-kids/" } })
end, { desc = "Grep respo - form-kids" })

vim.keymap.set('n', '<leader>ga', function()
  Snacks.picker.grep({ dirs = { "/Users/user/work/respo/apps/api/" } })
end, { desc = "Grep respo - api" })

vim.keymap.set({'n', 'v'}, '<leader>le', function()
	vim.o.expandtab = true
	vim.lsp.buf.format()
end, { desc = "lsp format + expandtab=true" })
