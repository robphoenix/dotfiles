vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({ async = true })
end, {})
vim.keymap.set("n", "<leader>p", "<cmd>Format<CR>", { desc = "Format buffer" })

vim.api.nvim_create_user_command("Fold", function()
  vim.cmd("normal! zM")
end, {})

vim.api.nvim_create_user_command("OR", function()
  vim.lsp.buf.code_action({
    context = { only = { "source.organizeImports" }, diagnostics = {} },
    apply = true,
  })
end, {})
