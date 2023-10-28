Custom configuration based on [`NvChad`](https://github.com/NvChad/NvChad).

## Screenshots

![nvim dash](https://s1.ax1x.com/2023/08/28/pPaBBW9.png)

![nvim startup time](https://s1.ax1x.com/2023/08/28/pPaBsQ1.png)

![nvim cpp](https://s1.ax1x.com/2023/08/28/pPaBDzR.png)

## Install

1. install Neovim 0.9.1

```shell
curl -LO https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
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

## Extra plugins

- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [SmiteshP/nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [utilyre/barbecue.nvim](https://github.com/utilyre/barbecue.nvim)
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim)
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [folke/flash.nvim](https://github.com/folke/flash.nvim)
- [tzachar/local-highlight.nvim](https://github.com/tzachar/local-highlight.nvim)
- [nacro90/numb.nvim](https://github.com/nacro90/numb.nvim)
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [lukas-reineke/cmp-under-comparator](https://github.com/lukas-reineke/cmp-under-comparator)
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)
- [m4xshen/smartcolumn.nvim](https://github.com/m4xshen/smartcolumn.nvim)
- [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [nvim-telescope/telescope-live-grep-args.nvim](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)
- [declancm/cinnamon.nvim](https://github.com/declancm/cinnamon.nvim)
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [nvimdev/guard.nvim](https://github.com/nvimdev/guard.nvim)
- [stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim)
- [dstein64/nvim-scrollview](https://github.com/dstein64/nvim-scrollview)
- [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)

## Uninstall

```shell
# rm configs
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim
# rm neovim
sudo rm /usr/local/bin/nvim
sudo rm -rf /usr/local/share/nvim/
```
