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
vim.api.nvim_set_keymap("n", ",em", ":HopWord<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", ",wo", ":only<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", ",bo", ":BufOnly<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", ",ss", ":luafile ~/.config/nvim/lua/custom/init.lua<cr>", { noremap = true })

vim.cmd [[
command! BufOnly %bd | e#
  ]]
