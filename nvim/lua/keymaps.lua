local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<C-n>", ":Fern . -reveal=% -drawer -toggle -width=40<CR>", opts)
