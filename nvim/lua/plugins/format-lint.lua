local registry_ok, registry = pcall(require, "mason-registry")
if registry_ok then
  for _, tool in ipairs({ "prettier", "eslint_d", "stylelint" }) do
    local pkg_ok, pkg = pcall(registry.get_package, tool)
    if pkg_ok and not pkg:is_installed() then
      pkg:install()
    end
  end
end

require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
  },
  formatters = {
    prettier = {
      -- `prefer-file` keeps a project's own .prettierrc authoritative; these
      -- are only the fallback values for projects without one (the old
      -- coc-settings.json prettier.* values that differ from prettier's own
      -- defaults).
      prepend_args = {
        "--config-precedence",
        "prefer-file",
        "--print-width",
        "100",
        "--single-quote",
        "--trailing-comma",
        "es5",
        "--arrow-parens",
        "avoid",
      },
    },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
})

vim.api.nvim_create_user_command("Prettier", function()
  require("conform").format({ formatters = { "prettier" }, async = true })
end, {})

require("lint").linters_by_ft = {
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  css = { "stylelint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function()
    vim.cmd("silent! EslintFixAll")
  end,
})
