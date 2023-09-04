local M = {}

M.todos = {
  n = {
    ["<leader>td"] = { "<cmd> TodoTrouble <CR>", "Trouble todos" },
    ["<leader>ts"] = { "<cmd> TodoTelescope <CR>", "Telescope todos" },
  },
}

M.troubles = {
  n = {
    ["<leader>tt"] = { "<cmd> TroubleToggle <CR>", "Trouble toggle" },
  },
}

M.guard = {
  n = {
    ["<leader>fm"] = { "<cmd> GuardFmt <CR>", "Automatic format" },
  },
}

M.aerial = {
  n = {
    ["<leader>a"] = { "<cmd> AerialToggle! <CR>", "Aerial toggle" },
  },
}

return M
