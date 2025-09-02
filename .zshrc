# Directory where to store zinint plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinint
source "${ZINIT_HOME}/zinit.zsh"

# Source/Load Catppuccin syntax highlighting
# source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Keybindings

# ^a jump to the start of a line
# ^e jump to the end of a line
# ^b move backward on a command
# ^f move forward on a command
# ^p get the previous command from history
# ^n get the next command from history
# and much more...
bindkey -e
bindkey ^p history-search-backward
bindkey ^n history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias vim=nvim
alias ls="ls --color"
alias dots="cd ~/dotfiles/.config"
alias ..="cd .."
alias se="sudoedit"
alias mkdir='mkdir -p -v'

# Python
alias py='python3'
alias venv-activate='source .venv/bin/activate'
alias venv-create='python3 -m venv .venv'
alias venv-deactivate='deactivate'

# Zed
alias zed='env -u WAYLAND_DISPLAY zeditor'

# Shell integrations

# FZF
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#252525,spinner:#F2F4F8,hl:#EE5396 \
--color=fg:#F2F4F8,header:#EE5396,info:#BE95FF,pointer:#F2F4F8 \
--color=marker:#78A9FF,fg+:#F2F4F8,prompt:#BE95FF,hl+:#EE5396 \
--color=selected-bg:#353535 \
--color=border:#252525,label:#F2F4F8"

# oh my posh
# eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

export PATH=$PATH:/home/abdalrahman/.spicetify

# bun completions
[ -s "/home/abdalrahman/.bin/_bun" ] && source "/home/abdalrahman/.bin/_bun"

# envs
export PATH="/home/abdalrahman/.local/bin:/home/abdalrahman/.local/share/gem/ruby/3.4.0/bin:$PATH"


export EDITOR=nvim
export BUN_INSTALL="$HOME/.bin"
export PATH=$BUN_INSTALL/bin:$PATH
export MANPAGER="nvim +Man!"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


# pnpm
export PNPM_HOME="/home/abdalrahman/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Android sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORM_PLUGIN_PATH="/usr/share/licenses/qt5-wayland"
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
