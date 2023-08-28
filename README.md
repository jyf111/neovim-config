Custom configuration based on [`NvChad`](https://github.com/NvChad/NvChad).

## Screenshots

![nvim dash](https://s1.ax1x.com/2023/08/28/pPaBBW9.png)

![nvim startup time](https://s1.ax1x.com/2023/08/28/pPaBsQ1.png)

![nvim cpp](https://s1.ax1x.com/2023/08/28/pPaBDzR.png)

## Install

1. install Neovim 0.9.1

```bash
curl -LO https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
```

2. install NvChad


```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim # choose No
```

3. download custom configs
```bash
git clone https://github.com/jyf111/neovim-config ~/.config/nvim/lua/custom --depth 1
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
- [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [lukas-reineke/cmp-under-comparator](https://github.com/lukas-reineke/cmp-under-comparator)
- [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)
- [m4xshen/smartcolumn.nvim](https://github.com/m4xshen/smartcolumn.nvim)
- [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [nvim-telescope/telescope-live-grep-args.nvim](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)

## Uninstall

```bash
sudo rm /usr/local/bin/nvim
sudo rm -rf /usr/local/share/nvim/
# rm configs
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim
```
