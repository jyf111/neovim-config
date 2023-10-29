local M = {}

M.mason = {
  ensure_installed = {
    -- lsp
    "clangd",
    "gopls",
    "lua-language-server",
    "python-lsp-server",
    "rust-analyzer",
    -- formatter
    "clang-format",
    "isort",
    "stylua",
    -- linter
    "luacheck",
    "shellcheck",
  },
}

M.telescope = {
  extensions = {
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = {
        ["_"] = false, -- This key will be the default
        json = true, -- You can set the option for specific filetypes
        yaml = true,
      },
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
    },
  },
}

M.treesitter = {
  highlight = { enable = true, disable = { "c", "cpp", "rust" } },
  indent = { enable = true },
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "css",
    "csv",
    "diff",
    "dockerfile",
    "doxygen",
    "go",
    "gomod",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "regex",
    "rust",
    "vimdoc",
    "yaml",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = false,
      node_decremental = "<BS>",
    },
  },
}

M.trouble = {
  use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
}

M.fidget = {
  window = { blend = 0 },
  fmt = {
    max_messages = 3, -- The maximum number of messages stacked at any give time
  },
}

M.smartcolumn = {
  colorcolumn = "100",
  disabled_filetypes = {
    "help",
    "lazy",
    "lsp",
    "markdown",
    "mason",
    "nvdash",
    "text",
    "terminal",
    "toggleterm",
    "trouble",
    "Trouble",
  },
  custom_colorcolumn = {
    { cpp = "120", lua = "120" },
  },
  scope = "file",
}
return M
