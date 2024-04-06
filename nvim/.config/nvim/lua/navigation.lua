-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Keybinds to make split navigation easier.
--  Use Alt+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Creating new windows
vim.keymap.set('n', '<leader>xh', '<cmd>split<CR>', { desc = 'Split horizontally' })
vim.keymap.set('n', '<leader>xv', '<cmd>vsplit<CR>', { desc = 'Split vertically' })

-- Managing open windows
vim.keymap.set('n', '<leader>xq', '<cmd>only<CR>', { desc = 'Close all other windows' })
-- vim: ts=2 sts=2 sw=2 et
