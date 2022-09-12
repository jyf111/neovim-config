local vim = vim

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local leader = ","
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = leader
vim.g.maplocalleader = leader

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- basic 
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

keymap("n", "<C-s>", ":write<cr>", term_opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- modules
-- file tree(menu)
keymap('n', '<leader>mt', ':NvimTreeToggle<cr>', opts)
keymap('n', '<leader>mf', ':NvimTreeFocus<cr>', opts)
-- buffer line
keymap('n', '<leader>bg', ':BufferLinePick<cr>', opts)
keymap('n', '<leader>bj', ':BufferLineCyclePrev<cr>', opts)
keymap('n', '<leader>bk', ':BufferLineCycleNext<cr>', opts)
keymap('n', '<leader>b1', ':BufferLineGoToBuffer 1<cr>', opts)
keymap('n', '<leader>b2', ':BufferLineGoToBuffer 2<cr>', opts)
keymap('n', '<leader>b3', ':BufferLineGoToBuffer 3<cr>', opts)
keymap('n', '<leader>b4', ':BufferLineGoToBuffer 4<cr>', opts)
keymap('n', '<leader>b5', ':BufferLineGoToBuffer 5<cr>', opts)
keymap('n', '<leader>b6', ':BufferLineGoToBuffer 6<cr>', opts)
keymap('n', '<leader>b7', ':BufferLineGoToBuffer 7<cr>', opts)
keymap('n', '<leader>b8', ':BufferLineGoToBuffer 8<cr>', opts)
keymap('n', '<leader>b9', ':BufferLineGoToBuffer 9<cr>', opts)
-- accelerate jk  
keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
-- snip run
keymap('v', '<leader>r', ":SnipRun<cr>", opts)
-- telescope
keymap('n', '<leader>ff', ":Telescope find_files<cr>", opts)
keymap('n', '<leader>fg', ":Telescope live_grep<cr>", opts)
keymap('n', '<leader>fh', ":Telescope oldfiles<cr>", opts)
keymap('n', '<leader>fr', ":lua require('telescope').extensions.frecency.frecency{}<cr>", opts)
-- hop
keymap('n', '<leader>w', ":HopWord<cr>", opts)
keymap('n', '<leader>c', ":HopChar1<cr>", opts)
keymap('n', '<leader>p', ":HopPattern<cr>", opts)
-- lsp
keymap('n', '<leader>lr', ':Lspsaga rename<cr>', opts)
keymap('n', '<leader>lk', ':Lspsaga hover_doc<cr>', opts)
keymap('n', '<leader>ld', ':Lspsaga preview_definition<cr>', opts)
keymap('n', '<leader>lh', ':Lspsaga signature_help<cr>', opts)
keymap('n', '<leader>lu', ':Lspsaga lsp_finder<cr>', opts)
keymap('n', '<leader>la', ':Lspsaga code_action<cr>', opts)
keymap('n', '<leader>lo', ':LSoutlineToggle<cr>', opts)
-- lsp goto
-- keymap('n', '<leader>gD', vim.lsp.buf.declaration, opts)
-- keymap('n', '<leader>gd', vim.lsp.buf.definition, opts)
-- keymap('n', '<leader>gt', vim.lsp.buf.type_definition, opts)
-- keymap('n', '<leader>gi', vim.lsp.buf.implementation, opts)
keymap('n', '<leader>gp', ':Lspsaga diagnostic_jump_prev<cr>', opts)
keymap('n', '<leader>gn', ':Lspsaga diagnostic_jump_next<cr>', opts)
-- keymap('n', '<leader>gr', vim.lsp.buf.references, opts)
keymap("n", "<C-u>", ":lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", opts)
keymap("n", "<C-d>", ":lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", opts)
