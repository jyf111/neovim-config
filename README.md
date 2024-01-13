Custom configuration based on [`NvChad`](https://github.com/NvChad/NvChad).

## Screenshots

![nvim dash](https://s1.ax1x.com/2023/08/28/pPaBBW9.png)

![nvim startup time](https://s1.ax1x.com/2023/08/28/pPaBsQ1.png)

![nvim cpp](https://s1.ax1x.com/2023/08/28/pPaBDzR.png)

## Install

1. install newest Neovim (current 0.9.5)

```shell
curl -LO https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/local/bin/nvim
rm ./nvim.appimage
```

2. install NvChad

```shell
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim # press N
```

3. download custom configs

```shell
rm -rf ~/.config/nvim/lua/custom && git clone https://github.com/jyf111/neovim-config ~/.config/nvim/lua/custom --depth 1
```

4. LSP server dependencies

```shell
sudo apt install python3-venv luarocks
```

5. update

```shell
NvChadUpdate
```

## Extra plugins

### Lang

- [stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim) code outline
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) autoformat
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [dhlhc/glance.nvim](https://github.com/dhlhc/glance.nvim)
- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [lukas-reineke/cmp-under-comparator](https://github.com/lukas-reineke/cmp-under-comparator)
- [p00f/clangd_extensions.nvim](https://github.com/p00f/clangd_extensions.nvim)
- [mrcjkb/rustaceanvim](https://github.com/mrcjkb/rustaceanvim)
- [nvim-treesitter/nvim-treesitter-context](nvim-treesitter/nvim-treesitter-context)
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [andymass/vim-matchup](https://github.com/andymass/vim-matchup)

### Editor

- [utilyre/barbecue.nvim](https://github.com/utilyre/barbecue.nvim)
- [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) fold column
- [folke/flash.nvim](https://github.com/folke/flash.nvim)
- [echasnovski/mini.cursorword](https://github.com/echasnovski/mini.cursorword)
- [nacro90/numb.nvim](https://github.com/nacro90/numb.nvim) peek jump to line number
- [dstein64/nvim-scrollview](https://github.com/dstein64/nvim-scrollview) scroll bar

### Tool

- [f-person/git-blame](https://github.com/f-person/git-blame)
- [keaising/im-select.nvim](https://github.com/keaising/im-select.nvim)
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim)
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [nvim-telescope/telescope-live-grep-args.nvim](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)
- [aaronhallaert/advanced-git-search.nvim](https://github.com/aaronhallaert/advanced-git-search.nvim)

### UI

- [echasnovski/mini.animate](https://github.com/echasnovski/mini.animate)
- [echasnovski/mini.indentscope](https://github.com/echasnovski/mini.indentscope)
- [declancm/cinnamon.nvim](https://github.com/declancm/cinnamon.nvim) smooth movement
- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)
- [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim) LSP progress notify
- [m4xshen/smartcolumn.nvim](https://github.com/m4xshen/smartcolumn.nvim) colorcolumn

## Uninstall

```shell
# rm neovim
sudo rm /usr/local/bin/nvim
sudo rm -rf /squashfs-root/
# rm configs
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim
```
