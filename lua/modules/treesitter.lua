-- nvim-treesitter config
require('nvim-treesitter.configs').setup({
    -- ensure_installed = "maintained", -- for installing all maintained parsers
    ensure_installed = { "bash", "make", "c", "cpp", "python", "lua" }, -- for installing specific parsers
    sync_install = true, -- install synchronously
    ignore_install = {}, -- parsers to not install
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false, -- disable standard vim highlighting
    },
    rainbow = {
        enable = false,
        extended_mode = true,
        max_file_lines = 1000,
    }
})
require("nvim-treesitter.install").prefer_git = true
local parsers = require("nvim-treesitter.parsers").get_parser_configs()
for _, p in pairs(parsers) do
    p.install_info.url = p.install_info.url:gsub("https://github.com/", "git@github.com:")
end
-- TODO: change when color scheme change
-- vim.cmd('hi rainbowcol1 guifg=#88C0D0')

