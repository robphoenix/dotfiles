local ts = require("nvim-treesitter")
ts.setup()

local parsers = {
  "javascript",
  "typescript",
  "tsx",
  "json",
  "css",
  "html",
  "graphql",
  "markdown",
  "markdown_inline",
  "lua",
  "vim",
  "vimdoc",
  "bash",
  "yaml",
}

ts.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
    if vim.tbl_contains(parsers, lang) then
      pcall(vim.treesitter.start)
    end
  end,
})

require("render-markdown").setup({})

require("ts_context_commentstring").setup({ enable_autocmd = false })
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("TSContextCommentstring", { clear = true }),
  callback = function()
    local ok, internal = pcall(require, "ts_context_commentstring.internal")
    if ok then
      internal.update_commentstring()
    end
  end,
})
