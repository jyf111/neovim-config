require "nvchad.mappings"

local map = vim.keymap.set

-- aerial
map("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Aerial toggle" })
map("n", "<leader>ta", "<cmd>Telescope aerial<CR>", { desc = "Telescope aerial" })

-- glance
map("n", "<leader>gd", "<cmd>Glance definitions<CR>", { desc = "Glance definitions" })
map("n", "<leader>gr", "<cmd>Glance references<CR>", { desc = "Glance references" })
map("n", "<leader>gt", "<cmd>Glance type_definitions<CR>", { desc = "Glance type definitions" })
map("n", "<leader>gi", "<cmd>Glance implementations<CR>", { desc = "Glance implementations" })

-- markdown
map("n", "<F12>", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })

-- advanced_git_search
map("n", "<leader>gs", "<cmd>AdvancedGitSearch<CR>", { desc = "Advanced git search" })

-- livegrep
map(
  "n",
  "<leader>fg",
  "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Telescope live grep args" }
)

-- todos
map("n", "<leader>td", "<cmd>Trouble todo<CR>", { desc = "Trouble todo" })
map("n", "<leader>ts", "<cmd>TodoTelescope<CR>", { desc = "Telescope todo" })

-- troubles
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble toggle" })

-- trailspace
map("n", "<leader>rt", "<cmd>lua MiniTrailspace.trim()<CR>", { desc = "Remove trailspace" })
