local vim = vim

vim.g.did_load_filetypes = 1
vim.g.did_load_fzf = 1
vim.g.did_load_gtags = 1
vim.g.did_load_gzip = 1
vim.g.did_load_tar = 1
vim.g.did_load_tarPlugin = 1
vim.g.did_load_zip = 1
vim.g.did_load_zipPlugin = 1
vim.g.did_load_getscript = 1
vim.g.did_load_getscriptPlugin = 1
vim.g.did_load_vimball = 1
vim.g.did_load_vimballPlugin = 1
vim.g.did_load_matchit = 1
vim.g.did_load_matchparen = 1
vim.g.did_load_2html_plugin = 1
vim.g.did_load_logiPat = 1
vim.g.did_load_rrhelper = 1
vim.g.did_load_netrw = 1
vim.g.did_load_netrwPlugin = 1
vim.g.did_load_netrwSettings = 1
vim.g.did_load_netrwFileHandlers = 1
-- python host
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python3"
-- basics
vim.cmd('filetype plugin indent on')

local options = {
    backup = false,
    clipboard = "unnamedplus",
    mouse = "a",
    cmdheight = 1,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = true,
    pumheight = 10,
    showmode = false,
    showtabline = 2,
    smartcase = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    autoindent = true,
    smarttab = true,
    softtabstop = 4,
    cursorline = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    scrolloff = 2,
    sidescrolloff = 5,
    guifont = "Source Code Pro:h16",
    shiftround = true,
    autowrite = true,
    lazyredraw = true,
    timeout = true,
    ttimeout = true,
    timeoutlen = 500,
    ttimeoutlen = 0,
    ignorecase = true,
    wildignorecase = true,
    wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
    whichwrap = "h,l,<,>,[,],~",
    formatoptions = "1jcroql",
    shortmess = "aoOTIcF",
    termguicolors = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
