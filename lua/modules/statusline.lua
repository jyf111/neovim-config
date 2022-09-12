local mini_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = { "progress" },
    lualine_z = { "location" },
}
local outline = {
    sections = mini_sections,
    filetypes = { "lspsagaoutline" },
}
local navic = require("nvim-navic")
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onenord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {
        { navic.get_location, cond = navic.is_available },
        'lsp_progress',
    },
    lualine_x = {
        {
			"diagnostics",
            sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
		},
    },
    lualine_y = {
		{ "encoding" },
		{
			"fileformat",
			icons_enabled = true,
		},
        { "filetype", colored = true, icon_only = true },
    },
    lualine_z = {'progress', 'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {
      "nvim-tree",
      "toggleterm",
      outline,
  }
}
