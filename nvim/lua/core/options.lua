vim.g.mapleader = " "

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.colorcolumn = "80"
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.mouse = "a"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undofile = false
vim.opt.updatetime = 50
vim.opt.wrap = true
vim.opt.guifont = "JetBrainsMono Nerd Font:h15"

vim.o.linebreak = true
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.whichwrap = 'bs<>[]hl'
vim.o.numberwidth = 4
vim.o.showtabline = 2
vim.o.backspace = 'indent,eol,start'
vim.o.pumheight = 10
vim.o.conceallevel = 0
vim.o.fileencoding = 'utf-8'
vim.o.breakindent = true
vim.o.timeoutlen = 300
vim.o.writebackup = false
vim.o.completeopt = 'menuone,noselect'

vim.opt.shortmess:append 'c'
vim.opt.isfname:append("@-@")
vim.opt.iskeyword:append('-')
vim.opt.formatoptions:remove { 'c', 'r', 'o' }
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles'
