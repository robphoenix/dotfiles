require("snacks").setup({
  dashboard = {
    sections = {
      { section = "header" },
      { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
      { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
    },
  },
  picker = {},
})

vim.keymap.set("n", "<leader>f", function()
  Snacks.picker.files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>b", function()
  Snacks.picker.buffers()
end, { desc = "List buffers" })
vim.keymap.set("n", "<leader>h", function()
  Snacks.picker.recent()
end, { desc = "Recent files" })
vim.keymap.set("n", "<leader>s", function()
  Snacks.picker.grep()
end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>y", function()
  Snacks.picker.registers()
end, { desc = "Yank / registers history" })
vim.keymap.set("n", "<leader>o", function()
  Snacks.picker.lsp_symbols()
end, { desc = "Document symbols" })
