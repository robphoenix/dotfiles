local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- re-source config; vim.pack.add() re-runs and installs any newly added
-- plugins, :restart to fully load them
map("n", "<leader>1", "<cmd>source $MYVIMRC<CR>", { desc = "Reload config" })

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- terminal window navigation / mode
map("t", "<C-h>", [[<C-\><C-n><C-w>h]])
map("t", "<C-j>", [[<C-\><C-n><C-w>j]])
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])
map("t", "<C-l>", [[<C-\><C-n><C-w>l]])
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Terminal to normal mode" })

map("n", "<leader>/", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save" })
map("n", "<BS>", "<C-^>", { desc = "Alternate buffer" })

-- L/H to end/start of line
map("n", "L", "$")
map("x", "L", "$h")
map("o", "L", "$")
map({ "n", "x", "o" }, "H", "^")

-- visual shifting keeps selection
map("x", "<", "<gv")
map("x", ">", ">gv")

-- recenter screen on search jumps and half/full-page scroll
map({ "n", "x" }, "n", "nzz")
map({ "n", "x" }, "N", "Nzz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- visual-line-aware up/down
map({ "n", "x" }, "j", "gj")
map({ "n", "x" }, "k", "gk")

-- substitute word under cursor
map("n", "<C-s>", [[:%s/<C-r><C-w>//c<Left><Left>]], { desc = "Substitute word under cursor" })

map("n", "<leader>a", "<cmd>cclose<CR>", { desc = "Close quickfix" })

-- repeat `.` over a visual selection
map("x", ".", ":normal .<CR>")

-- resize splits (Option/Alt-h/l/j/k send these composed glyphs on macOS)
map("n", "˙", "<cmd>vertical resize -10<CR>", { silent = true })
map("n", "¬", "<cmd>vertical resize +10<CR>", { silent = true })
map("n", "∆", "<cmd>resize -10<CR>", { silent = true })
map("n", "˚", "<cmd>resize +10<CR>", { silent = true })

-- command-line history (Option/Alt-j/k)
map("c", "˚", "<Up>")
map("c", "∆", "<Down>")
