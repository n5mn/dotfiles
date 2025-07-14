local keymaps = require("plugins.keymaps.lsp")
return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',

			{ 'j-hui/fidget.nvim', opts = {} },

			'folke/neodev.nvim',
		},
		config = function()
			local on_attach = function(_, bufnr)
				keymaps(bufnr)
			end
			local servers = {
				gopls = {},
				pyright = {},
				bashls = {},
				rust_analyzer = {},
				terraformls = {},
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			local mason_lspconfig = require 'mason-lspconfig'

			mason_lspconfig.setup {
				ensure_installed = vim.tbl_keys(servers),
			}

			local lspconfig = require 'lspconfig'
			for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
				lspconfig[server].setup {
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server],
					filetypes = (servers[server] or {}).filetypes,
				}
			end
		end
	}
}
