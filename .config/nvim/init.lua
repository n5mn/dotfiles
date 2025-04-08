if vim.loader then
	vim.loader.enable()
end

require("config.options")
require("config.lazy")
require("config.filetypes")
require("config.keymaps")


require('mason').setup()
require('mason-lspconfig').setup()

