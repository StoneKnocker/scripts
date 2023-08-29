-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- Setup language servers.
vim.wo.number = true
vim.wo.relativenumber = true

-- HopWord
vim.api.nvim_set_keymap('', '<Leader>w', ":HopWord<cr>", {silent = true, noremap = true})
