require("catppuccin").setup({
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "macchiato",
  },
})

vim.o.background = "dark"
vim.cmd.colorscheme("catppuccin-macchiato")

vim.keymap.set("n", "<F3>", function()
  vim.o.background = vim.o.background == "dark" and "light" or "dark"
end, { desc = "Toggle background" })
