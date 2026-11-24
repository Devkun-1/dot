-- icons
local icons = require("config.icons")

-- blink cmp
---@module 'blink.cmp'
---@type blink.cmp.Config
require("blink.cmp").setup({
	keymap = { preset = "enter" },

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		nerd_font_variant = "mono",
		kind_icons = icons.lspkind,
	},

	completion = {
		documentation = { auto_show = true },
		menu = {
			draw = {
				columns = {
					{ "kind_icon", "label", gap = 2 },
					{ "kind", "label_description", gap = 2 },
				},
			},
		},
		list = {
			selection = { auto_insert = true },
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	fuzzy = {
		implementation = "lua",
	},
})
