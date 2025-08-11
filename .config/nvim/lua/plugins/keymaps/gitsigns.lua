function keymaps(bufnr)

	local gs = package.loaded.gitsigns

	local function kmap(mode, l, r, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end

	kmap({ 'n', 'v' }, ']c', function()
		if vim.wo.diff then
			return ']c'
		end
		vim.schedule(function()
			gs.next_hunk()
		end)
		return '<Ignore>'
	end, { expr = true, desc = 'Jump to next hunk' })

	kmap({ 'n', 'v' }, '[c', function()
		if vim.wo.diff then
			return '[c'
		end
		vim.schedule(function()
			gs.prev_hunk()
		end)
		return '<Ignore>'
	end, { expr = true, desc = 'Jump to previous hunk' })

	-- Actions
	-- visual mode
	kmap('v', '<leader>hs', function()
		gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
	end, { desc = 'stage git hunk' })
	kmap('v', '<leader>hr', function()
		gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
	end, { desc = 'reset git hunk' })
	-- normal mode
	kmap('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
	kmap('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
	kmap('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
	kmap('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
	kmap('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
	kmap('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
	kmap('n', '<leader>hb', function()
		gs.blame_line { full = false }
	end, { desc = 'git blame line' })
	kmap('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
	kmap('n', '<leader>hD', function()
		gs.diffthis '~'
	end, { desc = 'git diff against last commit' })

	-- Toggles
	kmap('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
	kmap('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

	-- Text object
	kmap({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
end

return keymaps
