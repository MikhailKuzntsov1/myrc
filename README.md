# My .rc files

## Terminal

- Recommended terminal emulators: [Alacrity for GNU/Linux](https://github.com/alacritty/alacritty), [iTerm2 for OS X](https://github.com/gnachman/iTerm2)
- For better experience with my Nvim config I recommend using [FiraCode Nerd Font with ligatures & default icons](https://github.com/ryanoasis/nerd-fonts)

## Nvim config

- My neovim config is written with mostly lua
- This config is compatible with both console Nvim & GUI versions
- My preferred GUI is [Neovide](https://github.com/neovide/neovide)

![C workflow](./assets/nvim_c.png)
![Lua workflow](./assets/nvim_lua_2.png)
![Lua plugins](./assets/nvim_lua_plugins.png)

## Usage

```bash
$ git clone https://github.com/MikhailKuzntsov1/myrc.git
$ cd myrc
$ ./install.sh
```

## Todo:

- [X] Disable <S-Caps> and <C-Caps> in `.Xmodmap` (`solved with setxkbmap``)
- [ ] Add better font size configuration
- [ ] Add more wallpaper (in particular - pixelart)


## Credits

- Some things in `.vimrc` & `.tmux.conf` were stolen from my fellow S21 students
  [@reysand](https://github.com/reysand/dotfiles) and [@bezlant](https://github.com/bezlant).
  I'm grateful to you for making your dot files public.
  It's definitely worth checking out these guys configs! :)
- [Christian Chiarulli @ChristianChiarulli](https://github.com/ChristianChiarulli) created awesome
  tutorial on lua configuration of NeoVim. It is available on [Youtube](https://www.youtube.com/watch?v=ctH-a-1eUME&t=9s&ab_channel=chris%40machine). Many things in my NeoVim
  are based on his tutorial. Although, some things in this tutorial may be outdated.
