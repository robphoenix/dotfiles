local autocmd = vim.api.nvim_create_autocmd

autocmd("FocusLost", { pattern = "*", command = "silent! wa" })

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.md",
  callback = function()
    vim.bo.filetype = "markdown"
    vim.bo.textwidth = 80
    vim.bo.wrapmargin = 0
    vim.wo.wrap = true
    vim.wo.spell = true
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "gitconfig",
  command = "setlocal filetype=.gitconfig",
})

autocmd("FileType", { pattern = "gitcommit", command = "setlocal spell" })

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.yaml", "*.yml" },
  command = "setlocal ts=2 sw=2 sts=2",
})
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".prettierrc",
  command = "set filetype=yaml",
})

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.js",
  command = "setlocal ts=2 sw=2 sts=2",
})

autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.csv", command = "setfiletype csv" })

-- Nunjucks/11ty templates forced to htmldjango for highlighting purposes only;
-- no formatter is wired up for these, format manually (see nvim migration notes)
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.html",
  command = "set syntax=htmldjango filetype=htmldjango ts=2 sw=2 sts=2",
})

autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd.startinsert()
    end
  end,
})

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.tbl_contains({ "markdown", "md" }, vim.bo.filetype) then
      return
    end
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})
