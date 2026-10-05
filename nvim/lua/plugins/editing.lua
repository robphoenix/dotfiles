require("nvim-surround").setup()
require("mini.bufremove").setup()
require("flash").setup()

vim.keymap.set("n", "<leader>q", function()
  local listed = vim.tbl_filter(function(buf)
    return vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())

  if #listed <= 1 then
    vim.cmd("qa")
  else
    require("mini.bufremove").delete(0, false)
  end
end, { desc = "Close buffer (quit if last)" })

vim.keymap.set({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash jump" })
vim.keymap.set({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash treesitter jump" })
