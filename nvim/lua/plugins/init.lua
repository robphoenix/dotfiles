vim.pack.add({
  -- kept from the old config
  "https://github.com/tpope/vim-unimpaired",
  "https://github.com/jparise/vim-graphql",
  "https://github.com/calind/selenized.nvim",
  "https://github.com/nvim-lua/plenary.nvim",

  -- snippets
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/L3MON4D3/LuaSnip",

  -- editing
  "https://github.com/echasnovski/mini.bufremove",
  "https://github.com/echasnovski/mini.icons",
  "https://github.com/kylechui/nvim-surround",
  "https://github.com/folke/flash.nvim",

  -- ui
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/brenoprata10/nvim-highlight-colors",

  -- treesitter
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",

  -- file tree
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-neo-tree/neo-tree.nvim",

  -- dashboard + picker
  "https://github.com/folke/snacks.nvim",

  -- LSP / completion / formatting / linting
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/b0o/schemastore.nvim",
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/mfussenegger/nvim-lint",
})

require("plugins.colorscheme")
require("plugins.ui")
require("plugins.treesitter")
require("plugins.editing")
require("plugins.completion")
require("plugins.lsp")
require("plugins.format-lint")
require("plugins.finder")
require("plugins.dashboard")
