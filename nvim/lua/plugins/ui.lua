require("mini.icons").setup()

require("lualine").setup({
  options = {
    theme = "auto",
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = {},
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
})

require("nvim-highlight-colors").setup({})
