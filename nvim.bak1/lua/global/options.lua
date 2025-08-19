-- global
vim.loader.enable()
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.updatetime = 200
vim.o.timeoutlen = 300
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ui
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 4
vim.o.smoothscroll = false
vim.o.showmode = false
vim.o.ruler = false
vim.o.cmdheight = 0

-- fold
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldtext = ""
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- edit
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.inccommand = "nosplit"

-- format
vim.o.tabstop = 2
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.conceallevel = 2

--file
vim.o.confirm = true
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.swapfile = false
