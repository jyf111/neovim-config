local overrides = require "configs.overrides"

return {
  {
    "stevearc/aerial.nvim",
    lazy = true,
    event = "LspAttach",
    opts = {},
  },
  {
    "dnlhc/glance.nvim",
    lazy = true,
    event = "LspAttach",
  },
  {
    "Bekaboo/dropbar.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = overrides.mason,
      },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "kevinhwang91/nvim-ufo",
        dependencies = {
          { "kevinhwang91/promise-async" },
          {
            "luukvbaal/statuscol.nvim",
            opts = {},
            config = function()
              require "configs.statuscol"
            end,
          },
        },
        init = function()
          vim.o.foldcolumn = "1" -- '0' is not bad
          vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
          vim.o.foldlevelstart = 99
          vim.o.foldenable = true
        end,
        config = function()
          require "configs.nvim-ufo"
        end,
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      {
        "hrsh7th/cmp-cmdline",
        event = "CmdlineEnter",
        config = function()
          require "configs.cmp-cmdline"
        end,
      },
      { "lukas-reineke/cmp-under-comparator" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "f3fora/cmp-spell" },
      { "hrsh7th/cmp-buffer" },
      {
        "p00f/clangd_extensions.nvim",
        lazy = true,
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
    lazy = true,
    build = ":TSUpdate",
    event = "BufReadPre",
    opts = overrides.treesitter,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
      },
      {
        "windwp/nvim-ts-autotag",
      },
      {
        "andymass/vim-matchup",
      },
    },
  },
  {
    "folke/flash.nvim",
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    opts = {},
  },
  {
    "echasnovski/mini.cursorword",
    lazy = true,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    version = false,
    config = function()
      require("mini.cursorword").setup {}
    end,
  },
  {
    "nacro90/numb.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("numb").setup {}
    end,
  },
  {
    "dstein64/nvim-scrollview",
    lazy = true,
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function()
      require "configs.scrollview"
    end,
  },
  {
    "LunarVim/bigfile.nvim",
    lazy = false,
  },
  {
    "f-person/git-blame.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  },
  {
    "keaising/im-select.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
      require("im_select").setup {}
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    ft = "markdown",
    build = ":call mkdp#util#install()",
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = "Trouble",
    config = function()
      require("trouble").setup {}
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require("todo-comments").setup {}
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable "make" == 1,
        config = function()
          require("telescope").load_extension "fzf"
        end,
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension "live_grep_args"
        end,
      },
      {
        "aaronhallaert/advanced-git-search.nvim",
        cmd = { "AdvancedGitSearch" },
        config = function()
          require("telescope").load_extension "advanced_git_search"
        end,
        dependencies = {
          "tpope/vim-fugitive",
          "tpope/vim-rhubarb",
        },
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    lazy = true,
    event = "LspAttach",
    opts = {},
  },
  {
    "zbirenbaum/neodim",
    lazy = true,
    event = "LspAttach",
  },
  {
    "m4xshen/smartcolumn.nvim",
    lazy = true,
    opts = overrides.smartcolumn,
  },
}
