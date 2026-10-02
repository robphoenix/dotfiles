vim.o.background = "light"
vim.cmd.colorscheme("selenized")

vim.keymap.set("n", "<F3>", function()
  vim.o.background = vim.o.background == "dark" and "light" or "dark"
end, { desc = "Toggle background" })
