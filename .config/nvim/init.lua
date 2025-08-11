if vim.loader then
	vim.loader.enable()
end

require("core.options")
require("core.lazy")
require("core.filetypes")
require("core.keymaps")


require('mason').setup()
require('mason-lspconfig').setup()

