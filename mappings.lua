local M = {}

M.todos = {
  n = {
    ["<leader>td"] = { "<cmd> TodoTrouble <CR>", "trouble todos" },
    ["<leader>ts"] = { "<cmd> TodoTelescope <CR>", "telescope todos" },
  },
}

M.troubles = {
  n = {
    ["<leader>tt"] = { "<cmd> TroubleToggle <CR>", "trouble toggle" },
  },
}

M.guard = {
  n = {
    ["<leader>fm"] = { "<cmd> GuardFmt <CR>", "automatic format" },
  },
}

return M
