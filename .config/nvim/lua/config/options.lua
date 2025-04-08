-- set leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.mouse = ''

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.completeopt = 'menuone,noselect'

vim.opt.termguicolors = true

vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

