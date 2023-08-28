local M = {}

M.todos = {
  n = {
    ["<leader>td"] = { "<cmd> TodoTrouble <CR>", "trouble todos" },
    ["<leader>ts"] = { "<cmd> TodoTelescope <CR>", "telescope todos" },
  }
}

M.troubles = {
  n = {
    ["<leader>tt"] = { "<cmd> TroubleToggle <CR>", "trouble toggle" },
  }
}

return M
