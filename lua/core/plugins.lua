local vim = vim
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- theme
    use 'rmehri01/onenord.nvim'

    -- language
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'saadparwaiz1/cmp_luasnip'
    use 'glepnir/lspsaga.nvim'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
    use 'arkav/lualine-lsp-progress'
    use "ray-x/lsp_signature.nvim"
    use "lukas-reineke/cmp-under-comparator"
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use 'p00f/nvim-ts-rainbow'
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }
    use 'windwp/nvim-autopairs'

    -- buffer
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}
    use 'moll/vim-bbye' -- for more sensible delete buffer cmd

    -- status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}

    -- starup time optimise
	use 'dstein64/vim-startuptime'
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'

    -- git
	use {
		'lewis6991/gitsigns.nvim',
		tag = 'release',
	}

    -- file tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}

    -- indent guide
	use "lukas-reineke/indent-blankline.nvim"

    -- file telescope
    use "nvim-telescope/telescope.nvim"
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        "nvim-telescope/telescope-frecency.nvim",
        requires = {"tami5/sqlite.lua"}
    }

    -- floating terminal
	use 'akinsho/toggleterm.nvim'

    -- TODO: highlight
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- utils
    use { 'rainbowhxch/accelerated-jk.nvim' }
    -- dashboard
    use 'goolord/alpha-nvim'

    -- wilder menu
    use {
        'gelguy/wilder.nvim',
        requires = {
            "romgrk/fzy-lua-native",
            "kyazdani42/nvim-web-devicons",
        },
    }
    -- replace esc with jk
    use {'jdhao/better-escape.vim', event = 'InsertEnter'}
    -- comment
    use 'numToStr/Comment.nvim'
    -- css color
    use 'norcalli/nvim-colorizer.lua'

    use 'RRethy/vim-illuminate'

    use { 'michaelb/sniprun', run = 'bash ./install.sh'}

    -- key notify
    use "folke/which-key.nvim"

    -- clear highlight after searching
    use 'romainl/vim-cool'
    -- utility motion
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

end)
