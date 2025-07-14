local function telescope_live_grep_open_files()
	require('telescope.builtin').live_grep {
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	}
end

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>cd', vim.cmd.Ex, opts)

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', opts)

-- Basic clipboard interaction
vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y"')
vim.keymap.set({ 'n', 'x' }, '<leader>p', '+p')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", opts)
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", opts)

-- Diagnostic keymaps
vim.keymap.set('n', ']d', function()
	vim.diagnostic.goto_next()
end, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>l', vim.diagnostic.setqflist, { desc = 'Open diagnostics quickfix list' })

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>/', telescope_live_grep_open_files, { desc = '[/] Search in Open Files' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = '[F]ind Files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make file executable' })


