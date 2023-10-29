local M = {}

M.advanced_git_search = {
  n = {
    ["<leader>gs"] = {
      "<cmd> AdvancedGitSearch <CR>",
      "Advanced git search",
    },
  },
}

M.livegrep = {
  n = {
    ["<leader>fg"] = {
      "<cmd> lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      "Telescope live grep args",
    },
  },
}

M.todos = {
  n = {
    ["<leader>td"] = { "<cmd> TodoTrouble <CR>", "Trouble todo" },
    ["<leader>ts"] = { "<cmd> TodoTelescope <CR>", "Telescope todo" },
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

M.markdown = {
  n = {
    ["<F12>"] = { "<cmd> MarkdownPreviewToggle <CR>", "Toggle markdown preview"}
  }
}

return M
