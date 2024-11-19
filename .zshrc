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
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh


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
alias dots="cd ~/.config"
alias ..="cd .."
alias se="sudoedit"

# Shell integrations

# FZF
export FZF_DEFAULT_OPTS=" \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
    --color=selected-bg:#45475a \
    --multi"
eval "$(fzf --zsh)"

# Oh My Posh
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"
