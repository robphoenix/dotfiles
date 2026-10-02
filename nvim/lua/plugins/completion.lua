require("luasnip").config.setup({})
require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set("i", "<C-l>", function()
  local luasnip = require("luasnip")
  if luasnip.expandable() then
    luasnip.expand()
  end
end, { desc = "Expand snippet" })
vim.keymap.set({ "i", "s" }, "<C-j>", function()
  local luasnip = require("luasnip")
  if luasnip.jumpable(1) then
    luasnip.jump(1)
  end
end, { desc = "Next snippet placeholder" })
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  local luasnip = require("luasnip")
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { desc = "Previous snippet placeholder" })

local blink = require("blink.cmp")
-- builds the Rust fuzzy-matcher native library on first install/update
blink.build():pwait()

blink.setup({
  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
  },
  snippets = { preset = "luasnip" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  completion = {
    documentation = { auto_show = true },
  },
  fuzzy = { implementation = "rust" },
})

require("nvim-autopairs").setup({})
