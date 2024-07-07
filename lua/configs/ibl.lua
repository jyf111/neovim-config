local present, ibl = pcall(require, "ibl")

if not present then
  return
end

local highlight = {
  "pmenubg",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "pmenubg", { fg = "#ebb9b9" })
end)

ibl.setup {
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = { enabled = true, show_start = false, show_end = false, highlight = highlight },
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
}
