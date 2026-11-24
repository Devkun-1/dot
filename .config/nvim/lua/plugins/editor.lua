-- oil (defaults are fine, just enable it)
require("oil").setup({})

-- lazygit (use plenary for a floating window; <leader>lg opens it)
vim.g.lazygit_floating_window_use_plenary = 1
vim.g.lazygit_floating_window_scaling_factor = 0.9
vim.g.lazygit_use_neovim_remote = 1

-- telescope
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		-- use ripgrep as the search engine (must be installed)
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden", -- include hidden files
			"--glob=!.git/*", -- but exclude .git directory
		},
		prompt_prefix = "🔍 ",
		selection_caret = "➤ ",
		path_display = { "truncate" },
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = { prompt_position = "top", preview_width = 0.55 },
		},
		file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
		mappings = {
			-- normal mode mappings (press <esc> once first)
			n = {
				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["q"] = actions.close,
				["<c-c>"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = { hidden = true },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

telescope.load_extension("fzf")

-- auto pairs
require("nvim-autopairs").setup({})

-- snacks
require("snacks").setup({
	indent = { enabled = true },
	notifier = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
})

-- lazydev
require("lazydev").setup({})

-- conform
require("conform").setup({
	format_on_save = function(bufnr)
		local bufname = vim.api.nvim_buf_get_name(bufnr)

		-- don't auto-format dwl / suckless config headers
		if bufname:match("config%.def%.h$") or bufname:match("config%.h$") then
			return
		end

		return { timeout_ms = 500, lsp_fallback = true }
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettier" },
		c = { "clang-format" },
	},
})

-- nvim-ts-autotag
require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = false,
	},
})

-- bufferline
require("bufferline").setup({
	options = {
		separator_style = "thick",
		always_show_bufferline = false,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
	highlights = {
		fill = { bg = "NONE" },
		background = { bg = "NONE" },
		buffer_selected = { bg = "NONE", bold = true },
		separator = { bg = "NONE" },
		separator_visible = { bg = "NONE" },
		separator_selected = { bg = "NONE" },
		offset_separator = { bg = "NONE" },
	},
})
