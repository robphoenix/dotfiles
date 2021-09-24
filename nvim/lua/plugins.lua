local neogit = require('neogit')

neogit.setup {}

local neogit = require("neogit")

neogit.setup {
  disable_signs = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = true,
  auto_refresh = true,
  disable_builtin_notifications = false,
  commit_popup = {
      kind = "split",
  },
  integrations = {
    diffview = false
  }
}
