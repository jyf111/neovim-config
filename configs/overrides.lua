local M = {}

M.mason = {
  "clangd",
  "lua-language-server",
  "python-lsp-server",
}

M.treesitter = {
  highlight = { enable = true },
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

M.illuminate = {
  delay = 200,
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "alpha",
    "NvimTree",
    "packer",
    "neogitstatus",
    "Trouble",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "TelescopePrompt",
    "aerial",
    "Empty",
  },
  large_file_cutoff = 2000,
  large_file_overrides = {
    providers = { "lsp" },
  },
}

M.fidget = {
  window = { blend = 0 },
  fmt = {
    max_messages = 3, -- The maximum number of messages stacked at any give time
  },
}

M.smartcolumn = {
  colorcolumn = "80",
  disabled_filetypes = {
    "help",
    "text",
    "markdown",
    "lazy",
    "mason",
    "lsp",
    "nvdash",
  },
  custom_colorcolumn = {},
  scope = "file",
}
return M
