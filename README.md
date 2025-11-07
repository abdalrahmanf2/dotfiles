# My Dotfiles

Personal configuration files for my Arch Linux setup with niri, tmux, and a curated wallpaper collection.

# Gallery

![](https://github.com/abdlrhmn0x7e/dotfiles/blob/trunk/screenshots/image.png)

## 📂 Repository Structure

```
dotfiles/
├── oh-my-tmux/         # Pretty and versatile tmux configuration
├── wallpapers/         # Collection of 100+ carefully selected wallpapers
└── README.md
```

## 📗 System Information

### Window Manager & Desktop Environment

- **OS:** Arch Linux
- **WM:** [niri](https://github.com/YaLTeR/niri)
- **Display Manager:** [SDDM](https://github.com/sddm/sddm)
- **Shell:** ZSH
- **Terminal:** Ghostty
- **Terminal Multiplexer:** [tmux](https://github.com/tmux/tmux) with [Oh my tmux!](https://github.com/gpakosz/.tmux)

### Theming & Appearance

- **ColorScheme:** Gruvbox
- **GTK Theme:** [Gruvbox GTK Theme](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme)
- **Icon Theme:** [Gruvbox Icon Theme](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme)
- **Fonts:** JetBrainsMono Nerd Font
- **Cursor Theme:** [macOS](https://github.com/ful1e5/apple_cursor)

### Applications & Tools

- **Launcher/PowerMenu:** Modified Rofi Themes from [Adi1090x Rofi Themes](https://github.com/adi1090x/rofi)
- **Desktop Shell:** [Noctalia](https://docs.noctalia.dev/) - A sleek Quickshell config for Wayland (handles bar & wallpapers)
- **LockScreen:** [Betterlockscreen](https://github.com/betterlockscreen/betterlockscreen)
- **Spotify Theming:** Spicetify with Gruvbox Theme + Beautiful Lyrics Extension

## 🚀 Installation

### Prerequisites

Ensure you have the following installed on your system:

- `git`
- `stow`
- `tmux` (>= 2.6)
- `zsh`

### Quick Start

1. **Clone the repository** in your home directory:

```bash
git clone git@github.com:boodyf2/dotfiles.git
cd dotfiles
```

2. **Use GNU Stow** to create symlinks (if you have dotfiles to stow):

```bash
stow . --dotfiles
```

### Installing Oh my tmux!

This repository includes [Oh my tmux!](https://github.com/gpakosz/.tmux), a self-contained, pretty and versatile tmux configuration.

To install it, navigate to the `oh-my-tmux` directory and run the installation script:

```bash
cd oh-my-tmux
./install.sh
```

**Requirements for tmux:**

- tmux >= 2.6
- awk, perl (with Time::HiRes support), grep, and sed
- Outside of tmux, the `TERM` environment variable must be set to `xterm-256color`

For more details about configuring Oh my tmux!, see the [oh-my-tmux README](oh-my-tmux/README.md).

## 🎨 Wallpapers

This repository includes a collection of 100+ high-quality wallpapers in the `wallpapers/` directory, featuring:

- Anime artwork (Frieren, Dragon Ball, Serial Experiments Lain, etc.)
- Minimalist designs
- Nature scenes
- Abstract art
- Gruvbox themed wallpapers

Feel free to use any of these wallpapers with your preferred wallpaper daemon. The current setup uses [Noctalia](https://docs.noctalia.dev/), which handles wallpaper management as part of its Quickshell configuration.

### Setting a Wallpaper

Wallpapers are managed through Noctalia's configuration. Refer to the [Noctalia documentation](https://docs.noctalia.dev/) for details on configuring wallpapers.

## 📝 Notes

- Configuration files are meant to work with GNU Stow for easy management
- The Gruvbox color scheme is consistently used across all applications
- niri is a scrollable-tiling Wayland compositor with a focus on productivity
- Tmux configuration includes mouse mode, pane maximization, and vi-style keybindings
- All dotfiles are version-controlled for easy backup and synchronization
