local overrides = require("custom.configs.overrides")

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
      {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
          "SmiteshP/nvim-navic",
        },
        opts = {},
      },
      {
        "mfussenegger/nvim-lint",
        config = function()
          require("custom.configs.nvim-lint")
        end,
      },
      {
        "dnlhc/glance.nvim",
        config = function()
          require("custom.configs.glance")
        end
      },
      {
        "kevinhwang91/nvim-ufo",
        dependencies = {
          { "kevinhwang91/promise-async" },
          {
            "luukvbaal/statuscol.nvim",
            config = function()
              require("custom.configs.statuscol")
            end,
          },
        },
        init = function()
          vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
          vim.o.foldcolumn = "1" -- '0' is not bad
          vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
          vim.o.foldlevelstart = 99
          vim.o.foldenable = true
        end,
        config = function()
          require("custom.configs.nvim-ufo")
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "stevearc/conform.nvim",
    cmd = { "Format", "FormatEnable", "FormatDisable" },
    opts = {},
    config = function()
      require("custom.configs.conform")
    end,
  },
  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle" },
    config = function()
      require("custom.configs.aerial")
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = overrides.fidget,
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
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require("custom.configs.autotag")
        end,
      },
      {
        "abecodes/tabout.nvim",
        config = function()
          require("custom.configs.tabout")
        end,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      {
        "aaronhallaert/advanced-git-search.nvim",
        config = function()
          require("custom.configs.advanced-git-search")
        end,
        dependencies = {
          "tpope/vim-fugitive",
          "tpope/vim-rhubarb",
        },
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
    "tzachar/local-highlight.nvim",
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
    "declancm/cinnamon.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require("custom.configs.cinnamon")
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = ":call mkdp#util#install()",
  },
  {
    "m4xshen/smartcolumn.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = overrides.smartcolumn,
  },
  {
    "dstein64/nvim-scrollview",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function()
      require("custom.configs.scrollview")
    end,
  },
}

return plugins
