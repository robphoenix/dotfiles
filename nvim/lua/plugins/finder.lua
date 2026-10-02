local events = require("neo-tree.events")

require("neo-tree").setup({
  close_if_last_window = true,
  event_handlers = {
    {
      event = events.FILE_OPENED,
      handler = function()
        require("neo-tree.command").execute({ action = "close" })
      end,
    },
  },
  window = {
    position = "right",
    width = 50,
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignore = false,
    },
    never_show = { ".git", ".DS_Store" },
  },
})

vim.keymap.set("n", "-", "<cmd>Neotree reveal<CR>", { desc = "Reveal in file tree" })
