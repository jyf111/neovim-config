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
        events = { "BufReadPost", "BufNewFile", "BufWritePre" },
        config = function()
          require("custom.configs.nvim-lint")
        end,
      },
      {
        "dnlhc/glance.nvim",
        config = function()
          require("custom.configs.glance")
        end,
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
    "stevearc/conform.nvim",
    lazy = true,
    cmd = { "ConformInfo", "Format", "FormatEnable", "FormatDisable" },
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
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
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
      { "andymass/vim-matchup" },
    },
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
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  {
    "tzachar/local-highlight.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
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
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = overrides.smartcolumn,
  },
  {
    "dstein64/nvim-scrollview",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
      require("custom.configs.scrollview")
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
    "stevearc/dressing.nvim",
    lazy = true,
    opts = {},
  },
  {
    "keaising/im-select.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
      require("im_select").setup({})
    end,
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    cond = not vim.g.neovide,
    -- enabled = false,
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        resize = {
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
        cursor = {
          timing = animate.gen_timing.linear({ duration = 80, unit = "total" }),
        },
      }
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  },
}

return plugins
