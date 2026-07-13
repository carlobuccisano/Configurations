-- ========================================================================== --
-- 1. GENERAL SETTINGS (Options)
-- ========================================================================== --
vim.opt.number = true             -- Show absolute line number
vim.opt.relativenumber = true     -- Enable Hybrid Line Numbers
vim.opt.tabstop = 4               -- A tab is 4 spaces long
vim.opt.shiftwidth = 4            -- Indentation is 4 spaces
vim.opt.scrolloff = 10            -- Keep 10 lines above/below cursor
vim.opt.spell = true              -- Enable spellcheck
vim.opt.spelllang = { 'en_gb', 'en_us', 'fr', 'it' }

-- Disable middle-click paste in normal, insert, and visual modes
vim.keymap.set({ 'n', 'i', 'v' }, '<MiddleMouse>', '<Nop>')

-- Python folds --
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"

-- ========================================================================== --
-- 2. APPEARANCE & HIGHLIGHTS
-- ========================================================================== --
-- Deactivate concealing
vim.opt.conceallevel = 0

