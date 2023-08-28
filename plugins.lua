local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "neovim/nvim-lspconfig",
    event = { "CursorHold", "CursorHoldI" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = overrides.mason,
      },
      { "williamboman/mason-lspconfig.nvim" },
      { "SmiteshP/nvim-navic" },
      {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        opts = {},
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = overrides.treesitter,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
          require("custom.configs.ts-context")
        end,
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = overrides.trouble,
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    'tzachar/local-highlight.nvim',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("custom.configs.local-highlight")
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
    config = function()
      require("custom.configs.numb")
    end,
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
    config = function()
      require ("neoscroll").setup { mappings = {
        "<C-u>",
        "<C-d>",
        "<C-b>",
        "<C-f>",
        "zt",
        "zz",
        "zb",
      }}
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = ":call mkdp#util#install()",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "hrsh7th/cmp-cmdline",
        event = "CmdlineEnter",
        config = function()
          require("custom.configs.cmp-cmdline")
        end,
      },
      { "lukas-reineke/cmp-under-comparator" },
    },
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = overrides.fidget,
  },
  {
    "m4xshen/smartcolumn.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = overrides.smartcolumn,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    }
  }
}

return plugins