local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "<Leader>e", ":Oil --float<CR>", opts)
map("n", "<Leader>tc", ":tabclose<CR>", opts)
map("n", "<Leader>lf", ":lua vim.lsp.buf.format()<CR>", opts)
map("n", "<Leader>gp", ":Octo pr list<CR>", opts)
map("n", "<Leader>gP", ":Octo pr search<CR>", opts)
map("n", "<Leader>gi", ":Octo issue list<CR>", opts)
map("n", "<Leader>gI", ":Octo issue search<CR>", opts)
map("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<Leader>ab", ":ClaudeCodeAdd %<CR>", opts)
map("v", "<Leader>as", "<cmd>ClaudeCodeSend<CR>", opts)
