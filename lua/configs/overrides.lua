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
    "black",
    "stylua",
    -- linter
    "luacheck",
    "shellcheck",
  },
}

M.treesitter = {
  highlight = { enable = true, disable = { "c", "cpp", "rust" } },
  indent = { enable = true },
  matchup = { enable = true },
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
    "ron",
    "rust",
    "toml",
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
