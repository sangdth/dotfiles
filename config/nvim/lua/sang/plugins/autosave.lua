return {
  "okuuva/auto-save.nvim",
  version = "*", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = {
    trigger_events = {
      immediate_save = {
        { "VimLeavePre", pattern = { "*" } },
      },
      cancel_deferred_save = { "CursorMoved" },
    },
    debounce_delay = 3000,
  },
}
