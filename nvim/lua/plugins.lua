local jetpackfile = vim.fn.stdpath("data") .. "/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim"
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
	vim.fn.system(string.format("curl -fsSLo %s --create-dirs %s", jetpackfile, jetpackurl))
end

vim.cmd("packadd vim-jetpack")

require("jetpack.packer").add({
	{ "tani/vim-jetpack" },
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "nvim-lualine/lualine.nvim" },
	{ "zbirenbaum/copilot.lua", lazy = false },
  { "nvim-tree/nvim-web-devicons", lazy = false },
  { "stevearc/oil.nvim", lazy = false },
  { "malewicz1337/oil-git.nvim", lazy = false },
  { "sindrets/diffview.nvim" },
  { "lewis6991/gitsigns.nvim" },
  { "okuuva/auto-save.nvim" },
  { "nvim-treesitter/nvim-treesitter", lazy = false, run = ":TSUpdate" },
  { "MeanderingProgrammer/render-markdown.nvim" },
  { "neovim/nvim-lspconfig" },
  { "mason-org/mason.nvim" },
  { "mason-org/mason-lspconfig.nvim" },
  { "rafamadriz/friendly-snippets" },
  { "fang2hou/blink-copilot" },
  { "saghen/blink.cmp", tag = "v1.10.2" },
  { "windwp/nvim-autopairs" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  { "pwntester/octo.nvim" },
  { "coder/claudecode.nvim" }
})

local jetpack = require("jetpack")

require("catppuccin").setup({
	flavour = "mocha",
})

for _, name in ipairs(jetpack.names()) do
	if not jetpack.tap(name) then
		jetpack.sync()
		break
	end
end

vim.cmd.colorscheme("catppuccin-mocha")

vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight NormalNC guibg=none
  highlight NormalSB guibg=none
]])

require("lualine").setup({ options = { theme = "catppuccin-mocha" } })

local oil = require("oil")

local function with_entry_path(cmd)
	return function()
		local entry = oil.get_cursor_entry()
		local dir = oil.get_current_dir()
		if entry and dir then
			vim.cmd(cmd .. " " .. vim.fn.fnameescape(dir .. entry.name))
		end
	end
end

oil.setup({
	view_options = {
		show_hidden = true,
	},
	float = {
		border = "rounded",
		max_width = 0.8,
		max_height = 0.9,
	},
	keymaps = {
		["gd"] = { with_entry_path("DiffviewOpen --"), mode = "n", desc = "Diffview Open" },
		["gh"] = { with_entry_path("DiffviewFileHistory"), mode = "n", desc = "Diffview File History" },
		["gp"] = { "actions.paste_from_system_clipboard", mode = "n" },
		["<Leader>as"] = { "<cmd>ClaudeCodeTreeAdd<CR>", mode = "n", desc = "Add file to Claude" },
	},
})

require("oil-git").setup()

require("gitsigns").setup()

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})

require("claudecode").setup()

-- octo.nvim のバッファ（buftype=acwrite）は保存すると GitHub に送信されるため、通常のファイルだけを保存する
require("auto-save").setup({
	condition = function(buf)
		return vim.bo[buf].buftype == ""
	end,
})

require("nvim-treesitter").install({ "html", "latex", "yaml" })

require("render-markdown").setup()

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" },
})

-- npm を使わないため、以下のサーバーは mason ではなく pnpm でグローバルに導入する
-- pnpm add -g typescript vscode-langservers-extracted @olrtg/emmet-language-server
vim.lsp.enable({ "tsc", "html", "cssls", "emmet_language_server" })

require("python-lsp")

require("blink.cmp").setup({
	keymap = { preset = "default" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "copilot" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100,
				async = true,
			},
		},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

require("nvim-autopairs").setup()

require("telescope").load_extension("fzf")

require("octo").setup({
	picker_config = {
		-- <C-b> は herdr と被るため変更する
		mappings = { open_in_browser = { lhs = "<C-g>" } },
	},
})
