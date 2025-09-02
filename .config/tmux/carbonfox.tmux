#!/usr/bin/env bash

# carbonfox colors for Tmux

set -g mode-style "fg=#BE95FF,bg=#161616" # base0E (violet), base00 (background)

set -g message-style "fg=#BE95FF,bg=#161616" # base0E (violet), base00 (background)
set -g message-command-style "fg=#BE95FF,bg=#161616" # base0E (violet), base00 (background)

set -g pane-border-style "fg=#161616" # base00 (background)
set -g pane-active-border-style "fg=#78A9FF" # base0D (blue)

set -g status "on"
set -g status-position top
set -g status-justify "absolute-centre"

# keep status bar transparent
set -g status-style "fg=default,bg=default"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

# status‐left: session name
set -g status-left "\
#[fg=#252525,bg=#F2F4F8,bold] #S \
#[fg=#F2F4F8,bg=default,nobold,nounderscore,noitalics]" # base01, base05

# status‐right: prefix highlight, date/time, host
set -g status-right "\
#[fg=#161616,bg=#161616,nobold,nounderscore,noitalics]\
#[fg=#78A9FF,bg=#161616] #{prefix_highlight} \
#[fg=#161616,bg=#161616,nobold,nounderscore,noitalics]\
#[fg=#78A9FF,bg=#161616] %Y-%m-%d  %I:%M %p \
#[fg=#78A9FF,bg=#161616,nobold,nounderscore,noitalics]\
#[fg=#161616,bg=#78A9FF,bold] #h " # base00, base0D

if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "\
#{prefix_highlight} \
#[fg=#161616,bg=default,nobold,nounderscore,noitalics]\
#[fg=#F2F4F8,bg=#161616] %Y-%m-%d | %H:%M \
#[fg=#F2F4F8,bg=#161616,nobold,nounderscore,noitalics]\
#[fg=#161616,bg=#F2F4F8,bold] #h " # base00, base05
}

# window‐status for inactive windows
setw -g window-status-activity-style "underscore,fg=#33B1FF,bg=#161616" # base0C (cyan), base00 (background)
setw -g window-status-separator " "
setw -g window-status-style "NONE,fg=#33B1FF,bg=default" # base0C (cyan)
setw -g window-status-format "\
#[fg=#161616,bg=default,nobold,nounderscore,noitalics]\
#[fg=#B6B8BB,bg=#161616,bold] #I #W #F \
#[fg=#161616,bg=default,nobold,nounderscore,noitalics]" # base00, base06

# window‐status for current (active) window
setw -g window-status-current-format "\
#[fg=#161616,bg=default,nobold,nounderscore,noitalics]\
#[fg=#F2F4F8,bg=#161616,bold] #I #W #F \
#[fg=#161616,bg=default,nobold,nounderscore,noitalics]" # base00, base05

# tmux‐plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "\
#[fg=#08BDBA]#[bg=#161616]\
#[fg=#161616]#[bg=#08BDBA]" # base0A (teal/orange), base00
set -g @prefix_highlight_output_suffix ""
