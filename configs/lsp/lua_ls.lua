-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/lua_ls.lua
local util = require("lspconfig.util")

local root_files = {
  ".luarc.json",
  ".luarc.jsonc",
  ".luacheckrc",
  ".stylua.toml",
  "stylua.toml",
  "selene.toml",
  "selene.yml",
}

if not unpack then
  unpack = table.unpack
end

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_dir = function(fname)
    local root = util.root_pattern(unpack(root_files))(fname)
    if root and root ~= vim.env.HOME then
      return root
    end
    root = util.root_pattern("lua/")(fname)
    if root then
      return root .. "/lua/"
    end
    return util.find_git_ancestor(fname)
  end,
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
  settings = { Lua = { telemetry = { enable = false } } },
}
