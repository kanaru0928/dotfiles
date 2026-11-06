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
	{ "github/copilot.vim", lazy = false },
  { "nvim-tree/nvim-web-devicons", lazy = false },
  { "nvim-tree/nvim-tree.lua", lazy = false },
  { "sindrets/diffview.nvim" }
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

require("nvim-tree").setup({
	filters = {
		git_ignored = false,
	},
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")
		api.config.mappings.default_on_attach(bufnr)

		local function with_node_path(cmd)
			return function()
				local node = api.tree.get_node_under_cursor()
				if node and node.absolute_path then
					vim.cmd(cmd .. " " .. vim.fn.fnameescape(node.absolute_path))
				end
			end
		end

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		vim.keymap.set("n", "gd", with_node_path("DiffviewOpen --"), opts("Diffview Open"))
		vim.keymap.set("n", "gh", with_node_path("DiffviewFileHistory"), opts("Diffview File History"))
	end,
})

