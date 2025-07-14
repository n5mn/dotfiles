local keymaps = require("plugins.keymaps.gitsigns")
return {
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '-' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				keymaps(bufnr)
			end,
		},
	},
}
