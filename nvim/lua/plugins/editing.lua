require("nvim-surround").setup()
require("mini.bufremove").setup()
require("flash").setup()

vim.keymap.set("n", "<leader>q", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Close buffer" })

vim.keymap.set({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash jump" })
vim.keymap.set({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash treesitter jump" })
