local excluded_filetypes = {
  "Trouble",
  "checkhealth",
  "dashboard",
  "fzf",
  "help",
  "lazy",
  "lspinfo",
  "man",
  "mason",
  "toggleterm",
}
local excluded_buftypes = {
  "nofile",
  "prompt",
  "quickfix",
  "terminal",
}

return function()
  vim.api.nvim_create_autocmd("FileType", {
    desc = "Disable indentscope for certain filetypes",
    pattern = excluded_filetypes,
    callback = function(event)
      vim.b[event.buf].miniindentscope_disable = true
    end,
  })
  vim.api.nvim_create_autocmd("BufWinEnter", {
    desc = "Disable indentscope for certain buftypes",
    callback = function(event)
      if vim.tbl_contains(excluded_buftypes, vim.bo[event.buf].buftype) then
        vim.b[event.buf].miniindentscope_disable = true
      end
    end,
  })
  vim.api.nvim_create_autocmd("TermOpen", {
    desc = "Disable indentscope for terminals",
    callback = function(event)
      vim.b[event.buf].miniindentscope_disable = true
    end,
  })
end
