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
local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
  return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
    or get_option(filetype, option)
end
