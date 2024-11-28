# My Dotfiles

This repo contains the dotfiles for my hyprland setup

# Gallery

![](https://github.com/boodyf2/dotfiles/blob/trunk/Pictures/Screenshots/1.png)
![](https://github.com/boodyf2/dotfiles/blob/trunk/Pictures/Screenshots/2.png)

# 📗 Information

-   **OS :** Arch Linux
-   **WM:** Hyprland
-   **Shell:** ZSH
-   **GTK Theme:** [Rose Pine GTK Theme](https://github.com/rose-pine/gtk)
-   **ColorScheme:** [Catppuccin](https://github.com/Catppuccin/catppuccin)
-   **Fonts:** JetBrainsMono Nerd Font
-   **Cursor Theme:** [macOs](https://github.com/ful1e5/apple_cursor)
-   **Icon Theme:** [Rose Pine Icon Theme](https://github.com/rose-pine/gtk)
-   **Launcher/PowerMenu:** Modified Rofi Themes Taken From Here: [Adi1090x Rofi Themes](https://github.com/adi1090x/rofi)
-   **Bar:** [HyprPanel](https://github.com/Jas-SinghFSU/HyprPanel)
-   **Spotify Theming:** Custom Spicetify Theme + Beautiful Lyrics Extension
-   **LockScreen:** Hyprlock
-   **SDDM Theme:** [Catppuccin SDDM Theme](https://github.com/catppuccin/sddm)
-   **Idle Daemon:** Hypridle
-   **Terminal:** Kitty
-   **Wallpaper Daemon:** Hyprpaper

## Requirments

Ensure you have the following installed on your system

-   git
-   stow

### Note For SDDM

YOU NEED TO INSTALL THESE FOR IT TO WORK WITH HYPRLAND `layer-shell-qt layer-shell-qt5`

and ofcourse the stuff above mentioned in the information section with all of its deps

### Installation

First, clone the repo in your home directory

```bash
$ git clone git@github.com:boodyf2/dotfiles.git
$ cd dotfiles
```

and then use GNU stow to create symlinks

```bash
$ stow .
```
