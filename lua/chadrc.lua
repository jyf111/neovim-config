-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

local highlights = require "highlights"
M.ui = {
  theme = "aquarium",
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

return M
