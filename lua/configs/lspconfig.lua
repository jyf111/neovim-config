local configs = require("nvchad.configs.lspconfig")
local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local lspconfig = require("lspconfig")

local servers = {
  "clangd",
  "lua_ls",
  "pylsp",
  "gopls",
  "rust_analyzer",
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
})

local merge_tb = vim.tbl_deep_extend

local default_handler = {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

local clangd_handler = {
  on_attach = function(client, bufnr)
    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
    on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
}

require("mason-lspconfig").setup_handlers({
  function(server_name)
    local present, user_handler = pcall(require, "custom.configs.lsp." .. server_name)
    if server_name == "clangd" then
      if not present then
        lspconfig[server_name].setup(clangd_handler)
      else
        lspconfig[server_name].setup(merge_tb("force", clangd_handler, user_handler))
      end
    else
      if not present then
        lspconfig[server_name].setup(default_handler)
      else
        lspconfig[server_name].setup(merge_tb("force", default_handler, user_handler))
      end
    end
  end,
})
