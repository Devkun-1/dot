-- mason (also puts its bin directory on PATH, so tools are found by LSP/formatters)
require("mason").setup({})
require("mason-tool-installer").setup({
	ensure_installed = {
		-- language servers
		"lua-language-server",
		"clangd",
		"arduino-language-server",
		"emmet-language-server",
		"html-lsp",
		"css-lsp",
		"tailwindcss-language-server",
		"vtsls",
		"bash-language-server",
		-- formatters
		"stylua",
		"clang-format",
		"prettierd",
		"prettier",
		"isort",
		"black",
		-- tools
		"tree-sitter-cli",
	},
	auto_update = false,
	run_on_start = true,
})

vim.diagnostic.config({
	virtual_text = { prefix = "●" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "  ",
		},
	},
})

-- lua
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			codeLens = { enable = true },
			completion = { callSnippet = "Replace" },
			doc = { privateName = { "^_" } },
			hint = {
				enable = true,
				setType = false,
				paramType = true,
				paramName = "Disable",
				semicolon = "Disable",
				arrayIndex = "Disable",
			},
		},
	},
})

-- c / c++
vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index=false",
		"--clang-tidy=false",
		"--completion-style=detailed",
		"--header-insertion=never",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
})

-- arduino (needs explicit paths to arduino-cli, its config and clangd)
vim.lsp.config("arduino_language_server", {
	cmd = {
		"arduino-language-server",
		"-cli",
		vim.fn.exepath("arduino-cli"),
		"-cli-config",
		vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
		"-clangd",
		vim.fn.exepath("clangd"),
	},
})

-- emmet uses the defaults from nvim-lspconfig
vim.lsp.enable({
	"lua_ls",
	"clangd",
	"arduino_language_server",
	"emmet_language_server",
})
