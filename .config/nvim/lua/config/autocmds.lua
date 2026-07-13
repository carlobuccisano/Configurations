-- 1. Start native Treesitter for specific filetypes
--[[ vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'go', 'typescript' }, 
  callback = function()
    vim.treesitter.start()
  end,
}) ]]

-- 2. Force Conceal highlight to remain transparent, even if a theme reloads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, 'Conceal', { bg = 'NONE', fg = 'NONE' })
  end,
})

-- (Trigger it once on startup just in case)
vim.api.nvim_set_hl(0, 'Conceal', { bg = 'NONE', fg = 'NONE' })

