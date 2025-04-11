return {
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').setup({
				pickers = {
					find_files = {
						hidden = true
					}
				},
				defaults = {
					file_ignore_patterns = {
						".git/", "node_modules/"
					},
					ripgrep_arguments = {
						'rg',
						'--hidden',
						'--no-heading',
						'--with-filename',
						'--line-number',
						'--column',
						'--smart-case'
					},
					mappings = {
						i = {
							['<C-u>'] = false,
							['<C-d>'] = false,
						},
					},
				},
			})
			pcall(require('telescope').load_extension, 'fzf')
		end,
	}
}

