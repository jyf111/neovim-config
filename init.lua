local opt = vim.opt
local g = vim.g

opt.colorcolumn = "120"
opt.cursorcolumn = true
opt.encoding = "utf-8"
opt.backup = false
opt.swapfile = false
opt.wrap = false
opt.scrolloff = 2
opt.wildignore = {
  "*node_modules/**",
  "*.o",
  "*.obj",
  "*.dll",
  "*.jar",
  "*.pyc",
  "*.rbc",
  "*.class",
  "*.gif",
  "*.ico",
  "*.jpg",
  "*.jpeg",
  "*.png",
  "*.avi",
  "*.wav",
  "*.swp",
  ".lock",
  ".DS_Store",
  "tags.lock",
}

g.mapleader = ","

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
