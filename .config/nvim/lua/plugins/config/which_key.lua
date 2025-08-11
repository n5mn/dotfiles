return {
  {
		'folke/which-key.nvim',
		config = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>c_", hidden = true },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>d_", hidden = true },
				{ "<leader>g", group = "[G]it" },
				{ "<leader>g_", hidden = true },
				{ "<leader>h", group = "Git [H]unk" },
				{ "<leader>h_", hidden = true },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>r_", hidden = true },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>s_", hidden = true },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>t_", hidden = true },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>w_", hidden = true },
				{ "<leader>", group = "Visual <leader>", mode = "v" },
				{ "<leader>h", desc = "Git [H]unk", mode = "v" },
			})
		end,
	}
}
