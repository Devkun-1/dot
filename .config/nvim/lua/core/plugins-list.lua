local function github(repo)
	return "https://github.com/" .. repo
end

vim.pack.add({
	-- Editor
	{ src = github("stevearc/oil.nvim") }, -- Oil
	{ src = github("nvim-telescope/telescope.nvim") }, -- telescope
	{ src = github("nvim-telescope/telescope-fzf-native.nvim"), build = "cmake" }, -- telescope fzf
	{ src = github("folke/snacks.nvim") }, -- Snacks
	{ src = github("folke/lazydev.nvim") }, -- lazydev
	{ src = github("stevearc/conform.nvim") }, -- conform
	{ src = github("windwp/nvim-ts-autotag") }, -- ts-auto-tag
	{ src = github("akinsho/bufferline.nvim") }, -- bufferline
	{ src = github("kdheepak/lazygit.nvim") }, -- lazygit

	-- UI
	{ src = github("nvim-mini/mini.icons") }, -- Mini Icons
	{ src = github("folke/which-key.nvim") }, -- which-key
	{ src = github("windwp/nvim-autopairs") }, -- auto pairs
	{ src = github("nvim-lua/plenary.nvim") }, -- plenary
	{ src = github("nvim-tree/nvim-web-devicons") }, -- webdev-icons
	{ src = github("rcarriga/nvim-notify") }, -- notify
	{ src = github("folke/noice.nvim") }, -- noice
	{ src = github("MunifTanjim/nui.nvim") }, -- nui
	{ src = github("nvim-treesitter/nvim-treesitter") }, -- nvim-treesitter
	{ src = github("brenoprata10/nvim-highlight-colors") }, -- nvim-highlight-colors
	{ src = github("nvim-lualine/lualine.nvim") }, -- lualine
	{ src = github("folke/todo-comments.nvim") }, -- todo-comments
	{ src = github("folke/trouble.nvim") }, -- trouble
	{ src = github("lewis6991/gitsigns.nvim") }, -- git signs

	-- Utils
	{ src = github("saghen/blink.cmp"), version = vim.version.range("^1") }, -- blink cmp
	{ src = github("rafamadriz/friendly-snippets") }, -- friendly snippets
	{ src = github("saghen/blink.lib") }, -- blink library

	-- LSP
	{ src = github("neovim/nvim-lspconfig") }, -- lspconfig
	{ src = github("mason-org/mason.nvim") }, -- mason
	{ src = github("WhoIsSethDaniel/mason-tool-installer.nvim") }, -- mason-tool-installer

	-- Colorscheme
	{ src = github("Mofiqul/vscode.nvim") }, -- vscode theme
	{ src = github("catppuccin/nvim"), name = "catppuccin" }, -- catppuccin
	{ src = github("folke/tokyonight.nvim") }, -- tokyonight
})

require("plugins.editor")
require("plugins.ui")
require("plugins.colorscheme")
require("plugins.utils")
require("plugins.lspconfig")
