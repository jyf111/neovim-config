local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle" },
    config = function()
      require("custom.configs.aerial")
    end,
  },
  {
    "stevearc/conform.nvim",
    lazy = true,
    cmd = { "ConformInfo", "Format", "FormatEnable", "FormatDisable" },
    opts = {},
    config = function()
      require("custom.configs.conform")
    end,
  },
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
        "dnlhc/glance.nvim",
        config = function()
          require("custom.configs.glance")
        end,
      },
      {
        "mfussenegger/nvim-lint",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        config = function()
          require("custom.configs.nvim-lint")
        end,
      },
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
        "kevinhwang91/nvim-ufo",
        dependencies = {
          { "kevinhwang91/promise-async" },
          {
            "luukvbaal/statuscol.nvim",
            opts = {},
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
      {
        "p00f/clangd_extensions.nvim",
        lazy = true,
        config = function() end,
        opts = {
          inlay_hints = {
            inline = false,
          },
        },
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    lazy = true,
    version = "^3", -- Recommended
    ft = { "rust" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
    opts = overrides.treesitter,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        config = function()
          require("custom.configs.ts-context")
        end,
      },
      {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        config = function()
          require("custom.configs.autotag")
        end,
      },
      {
        "andymass/vim-matchup",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        init = function()
          vim.g.matchup_matchparen_offscreen = { method = "popup", fullwidth = 1, highlight = "Normal", syntax_hl = 1 }
        end,
        opts = { matchup = { enable = true } },
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  {
    "echasnovski/mini.cursorword",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    version = false,
    config = function()
      require("custom.configs.cursorword")
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
    config = function()
      require("custom.configs.numb")
    end,
  },
  {
    "dstein64/nvim-scrollview",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
      require("custom.configs.scrollview")
    end,
  },
  {
    "LunarVim/bigfile.nvim",
    lazy = false,
    config = function()
      require("custom.configs.bigfile")
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  },
  {
    "keaising/im-select.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
      require("im_select").setup({})
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = ":call mkdp#util#install()",
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
    confidgg = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
      },
      {
        "aaronhallaert/advanced-git-search.nvim",
        cmd = { "AdvancedGitSearch" },
        config = function()
          require("telescope").load_extension("advanced_git_search")
        end,
        dependencies = {
          "tpope/vim-fugitive",
          "tpope/vim-rhubarb",
        },
      },
    },
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    -- enabled = false,
    opts = function()
      local animate = require("mini.animate")
      return {
        resize = {
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          enable = false,
        },
        cursor = {
          timing = animate.gen_timing.linear({ duration = 80, unit = "total" }),
        },
      }
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = require("custom.configs.indentscope"),
  },
  {
    "declancm/cinnamon.nvim",
    event = "VeryLazy",
    config = function()
      require("custom.configs.cinnamon")
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    opts = {},
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = overrides.fidget,
  },
  {
    "m4xshen/smartcolumn.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = overrides.smartcolumn,
  },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  --   opts = {
  --     disabled_keys = {
  --       ["<Insert>"] = { "", "i" },
  --       ["<Home>"] = { "", "i" },
  --       ["<End>"] = { "", "i" },
  --       ["<PageUp>"] = { "", "i" },
  --       ["<PageDown>"] = { "", "i" },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("hardtime").setup(opts)
  --     require("hardtime").enable()
  --   end,
  -- },
}

return plugins
