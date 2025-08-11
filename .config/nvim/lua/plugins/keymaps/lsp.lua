local function lsp_keymaps(bufnr)
	local kmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end
	local telescope = require('telescope.builtin')

	kmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	kmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	kmap('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
	kmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
	kmap('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')
	kmap('<leader>D', telescope.lsp_type_definitions, 'Type [D]efinition')
	kmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
	kmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- See `:help K` for why this keymap
	kmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	kmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	kmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	kmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	kmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	kmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })

end

return lsp_keymaps
