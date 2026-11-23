-- uv sync で作成される .venv を優先し、次に有効な仮想環境と PATH を探す。
local function executable(root, name)
	local environments = { root .. "/.venv", vim.env.VIRTUAL_ENV }
	for _, environment in ipairs(environments) do
		local path = environment .. "/bin/" .. name
		if vim.fn.executable(path) == 1 then
			return path
		end
	end
	local path = vim.fn.exepath(name)
	return path ~= "" and path or nil
end

-- 両サーバーで同じルートと ty の検出結果を使い、同時起動を防ぐ。
local function python_root(bufnr)
	return vim.fs.root(bufnr, {
		"ty.toml", "pyrightconfig.json", "pyproject.toml", "setup.py",
		"setup.cfg", "requirements.txt", "Pipfile", ".git",
	}) or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
end

vim.lsp.config("pyright", {
	root_dir = function(bufnr, on_dir)
		local root = python_root(bufnr)
		if not executable(root, "ty") then
			on_dir(root)
		end
	end,
	before_init = function(_, config)
		local root = config.root_dir or vim.fn.getcwd()
		local python = executable(root, "python") or executable(root, "python3")
		if python then
			config.settings.python.pythonPath = python
		end
	end,
	settings = { pyright = { disableOrganizeImports = true } },
})

vim.lsp.config("ty", {
	-- ty はプロジェクトの .venv、有効な仮想環境、PATH にある場合だけ起動する。
	root_dir = function(bufnr, on_dir)
		local root = python_root(bufnr)
		if executable(root, "ty") then
			on_dir(root)
		end
	end,
	cmd = function(dispatchers, config)
		return vim.lsp.rpc.start({ executable(config.root_dir, "ty"), "server" }, dispatchers)
	end,
})

vim.lsp.config("ruff", {
	cmd = function(dispatchers, config)
		return vim.lsp.rpc.start({ executable(config.root_dir or vim.fn.getcwd(), "ruff") or "ruff", "server" }, dispatchers)
	end,
	on_attach = function(client)
		client.server_capabilities.hoverProvider = false
	end,
})

-- pnpm add -g pyright
-- uv tool install ruff
vim.lsp.enable({ "pyright", "ruff", "ty" })
