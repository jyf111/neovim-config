-- Options
local g = vim.g
g.mapleader = ","

local opt = vim.opt
opt.backup = false
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorcolumn = true -- Enable highlighting of the current column
opt.encoding = "utf-8"
opt.inccommand = "nosplit" -- preview incremental substitute
opt.list = true -- Show some invisible characters (tabs...
opt.swapfile = false
opt.wrap = false -- Disable line wrap
opt.scrolloff = 2 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context
opt.spelllang = { "en" }
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
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

-- Auto commands
local function augroup(name)
  return vim.api.nvim_create_augroup("nvchad_" .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

-- nvim lint
autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})
