-- set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.editorconfig = true
-- vim.cmd("let g:netrw_banner = 0")

vim.opt.guicursor = "n-v-i-c:block-Cursor"
-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.mouse = ""

vim.opt.undofile = true
vim.opt.backup= false
vim.opt.swapfile = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.completeopt = "menuone,noselect"

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- for files starting with @
vim.opt.isfname:append("@-@")
