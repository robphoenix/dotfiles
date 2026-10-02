require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "cssls",
    "jsonls",
    "eslint",
    "emmet_language_server",
    "html",
  },
  automatic_enable = true,
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

local function on_attach(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
  end

  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "gr", vim.lsp.buf.references, "Go to references")
  map("n", "K", vim.lsp.buf.hover, "Hover")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
  map({ "n", "x" }, "<leader>a", vim.lsp.buf.code_action, "Code action")
  map("n", "<leader>af", function()
    vim.lsp.buf.code_action({ context = { only = { "quickfix" } }, apply = true })
  end, "Apply autofix")
  map("n", "[g", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, "Previous diagnostic")
  map("n", "]g", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, "Next diagnostic")
  map("n", "<leader>aa", vim.diagnostic.setloclist, "All diagnostics")

  if client and client:supports_method("textDocument/documentHighlight") then
    local group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    on_attach(vim.lsp.get_client_by_id(ev.data.client_id), ev.buf)
  end,
})
