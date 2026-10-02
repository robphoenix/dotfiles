local opt = vim.opt

-- editing
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.ignorecase = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false
opt.showbreak = "↪"
opt.scrolljump = 5
opt.scrolloff = 3
opt.gdefault = true
opt.virtualedit = "onemore"
opt.linebreak = true
opt.hidden = true
opt.autowrite = true
opt.autoread = true
opt.history = 1000
opt.spelllang = "en_gb"
opt.spell = false
opt.modelines = 1

-- indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smarttab = true
opt.formatoptions:append("n")

-- search
opt.incsearch = true
opt.hlsearch = true

-- splits
opt.splitright = true
opt.splitbelow = true

-- folding
opt.foldenable = false
opt.foldnestmax = 10
opt.foldmethod = "syntax"
opt.foldcolumn = "1"

-- files
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = false
opt.fileformats = { "unix", "dos", "mac" }

-- command line / completion menu
opt.wildmenu = true
opt.wildmode = { "longest", "list:longest" }
opt.wildignore:append({ "*/.git/*", "*/tmp/*", "*.swp" })
opt.showcmd = true
opt.showmatch = true
opt.showmode = false
opt.cmdheight = 2
opt.shortmess:append("filmnrxoOtTc")
opt.report = 0
opt.startofline = false
opt.laststatus = 2
opt.complete:append("kspell")

-- key handling
opt.backspace = { "indent", "eol", "start" }
opt.whichwrap:append("<,>,h,l,[,]")
opt.timeout = false
opt.ttimeout = true
opt.ttimeoutlen = 10

-- diff
opt.diffopt:append("vertical")

if vim.fn.has("termguicolors") == 1 then
  opt.termguicolors = true
end

-- LSP UX
opt.updatetime = 300
opt.signcolumn = "yes"

vim.g.netrw_dirhistmax = 0
