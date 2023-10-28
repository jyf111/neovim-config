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

M.conform = {
  n = {
    ["<leader>fm"] = { "<cmd> Format <CR>", "Automatic format" },
  },
}

M.aerial = {
  n = {
    ["<leader>a"] = { "<cmd> AerialToggle! <CR>", "Aerial toggle" },
    ["<leader>ta"] = { "<cmd> Telescope aerial <CR>", "Telescope aerial" },
  },
}

M.glance = {
  n = {
    ["gD"] = { "<cmd> Glance definitions <CR>", "Glance definitions" },
    ["gR"] = { "<cmd> Glance references <CR>", "Glance references" },
    ["gY"] = { "<cmd> Glance type_definitions <CR>", "Glance type definitions" },
    ["gM"] = { "<cmd> Glance implementations <CR>", "Glance implementations" },
  },
}

return M
