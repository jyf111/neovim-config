---@class ChadrcConfig
local M = {}

local highlights = require("custom.highlights")
M.ui = {
  theme = "aquarium",
  transparency = false,
  hl_override = highlights.override,

  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Explore File", "<Ctrl> n", "NvimTreeToggle" },
      { "  Find File", "<leader> f f", "Telescope find_files" },
      { "󰈭  Find Word", "<leader> f w", "Telescope live_grep" },
      { "󰊢  Git Search", "<leader> g s", "AdvancedGitSearch" },
      { "  Themes", "<leader> t h", "Telescope themes" },
      { "  Mappings", "<leader> c h", "NvCheatsheet" },
    },
  },
}

M.mappings = require("custom.mappings")

M.plugins = "custom.plugins"

return M
