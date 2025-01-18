# My Dotfiles

This branch contains the dotfiles for my i3wm setup

# Gallery

![](https://github.com/boodyf2/dotfiles/blob/trunk/Pictures/Screenshots/3.jpeg)

# 📗 Information

- **OS :** Arch Linux
- **WM:** [I3](https://github.com/i3/i3)
- **Display Manager:** [ly](https://github.com/fairyglade/ly)
- **Shell:** ZSH
- **ColorScheme:** Tokyo Night
- **GTK Theme:** [Tokyo Night GTK Theme](https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme)
- **Fonts:** JetBrainsMono Nerd Font
- **Cursor Theme:** [macOs](https://github.com/ful1e5/apple_cursor)
- **Icon Theme:** [Tokyo Night Icon Theme](https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme)
- **Launcher/PowerMenu:** Modified Rofi Themes Taken From Here: [Adi1090x Rofi Themes](https://github.com/adi1090x/rofi)
- **Bar:** [Polybar](https://github.com/polybar/polybar)
- **Spotify Theming:** [Custom Spicetify Tokyo Night Theme](https://github.com/evening-hs/Spotify-Tokyo-Night-Theme) + Beautiful Lyrics Extension
- **LockScreen:** [Betterlockscreen](https://github.com/betterlockscreen/betterlockscreen)
- **Terminal:** Ghostty
- **Wallpaper Daemon:** [feh](https://github.com/derf/feh)

## Requirments

Ensure you have the following installed on your system

- git
- stow

### Installation

First, clone the repo in your home directory

```bash
$ git clone git@github.com:boodyf2/dotfiles.git
$ cd dotfiles
```

and then use GNU stow to create symlinks

```bash
$ stow . --dotfiles
```
