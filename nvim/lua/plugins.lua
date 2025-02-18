local jetpackfile = vim.fn.stdpath("data") .. "/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim"
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
	vim.fn.system(string.format("curl -fsSLo %s --create-dirs %s", jetpackfile, jetpackurl))
end

vim.cmd("packadd vim-jetpack")

require("jetpack.packer").add({
	{ "tani/vim-jetpack" },
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "itchyny/lightline.vim" },
	{ "github/copilot.vim", lazy = false },
  { "lambdalisue/fern.vim", as = "fern" },
  { "lambdalisue/vim-nerdfont", depends = "fern", as = "nerdfont" },
  { "lambdalisue/vim-fern-renderer-nerdfont", depends = "nerdfont" },
})

local jetpack = require("jetpack")

for _, name in ipairs(jetpack.names()) do
	if not jetpack.tap(name) then
		jetpack.sync()
		break
	end
end

vim.cmd.colorscheme("catppuccin-mocha")
vim.g.lightline = { ["colorscheme"] = "catppuccin" }
vim.g["fern#renderer"] = "nerdfont"
vim.g["fern#renderer#nerdfont#indent_markers"] = 1
