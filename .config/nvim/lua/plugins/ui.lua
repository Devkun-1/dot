-- mini-icons
require("mini.icons").setup({})

-- web dev icons
require("nvim-web-devicons").setup({})

-- which-key
require("which-key").setup({
	preset = "modern",
	spec = {
		{ "<leader>f", group = "Find" },
		{ "<leader>l", group = "Lazygit" },
	},
})

-- noice
require("noice").setup({
	cmdline = {
		enabled = true,
		view = "cmdline_popup",
		format = {
			cmdline = { pattern = "^:", icon = "", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = " 󰥗", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = " 󰥗", lang = "regex" },
			filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
			lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
			help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
			input = { view = "cmdline_input", icon = "󰥻 " },
		},
	},
	views = {
		cmdline_popup = {
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			filter_options = {},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
	notify = { enabled = true },
})

-- treesitter
local treesitter = require("nvim-treesitter")

treesitter.install({
	"json",
	"javascript",
	"typescript",
	"tsx",
	"go",
	"yaml",
	"html",
	"css",
	"python",
	"http",
	"prisma",
	"svelte",
	"graphql",
	"bash",
	"vim",
	"dockerfile",
	"gitignore",
	"query",
	"vimdoc",
	"c",
	"java",
	"rust",
	"ron",
})

-- safe treesitter start + indentation
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		pcall(vim.treesitter.start, buf)

		-- yaml and markdown keep their own indentation
		if ft ~= "yaml" and ft ~= "markdown" then
			vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.bo[buf].smartindent = false
			vim.bo[buf].cindent = false
		end
	end,
})

-- nvim-highlight-colors
require("nvim-highlight-colors").setup({
	enable_ansi = true,
	enable_xterm256 = true,
	enable_xtermTrueColor = true,
	custom_colors = {
		{ label = "%-%-theme%-primary%-color", color = "#0f1219" },
		{ label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
	},
})

-- lualine
require("lualine").setup({})

-- todo-comments
require("todo-comments").setup({})

-- trouble
require("trouble").setup({})

-- gitsigns
require("gitsigns").setup({
	signs = {
		delete = { text = "_" },
		topdelete = { text = "‾" },
	},
	signs_staged = {
		delete = { text = "_" },
		topdelete = { text = "‾" },
		untracked = { text = "┆" },
	},
})
