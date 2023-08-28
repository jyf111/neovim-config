---@type ChadrcConfig 
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = 'catppuccin',
  transparency = false,
  hl_override = highlights.override,

  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Find File", "<leader> f f", "Telescope find_files" },
      { "󰈭  Find Word", "<leader> f w", "Telescope live_grep" },
      { "  Themes", "<leader> t h", "Telescope themes" },
      { "  Mappings", "<leader> c h", "NvCheatsheet" },
    },
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
