#!/usr/bin/env bash

# OniVim colors for Tmux

set -g mode-style "fg=#957FB8,bg=#1f1f28"

set -g message-style "fg=#957FB8,bg=#1f1f28"
set -g message-command-style "fg=#957FB8,bg=#1f1f28"

set -g pane-border-style "fg=#1f1f28"
set -g pane-active-border-style "fg=#7e9cd8"

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
#[fg=#16161D,bg=#DCD7BA,bold] #S \
#[fg=#DCD7BA,bg=default,nobold,nounderscore,noitalics]"

# status‐right: prefix highlight, date/time, host
set -g status-right "\
#[fg=#1f1f27,bg=#1f1f27,nobold,nounderscore,noitalics]\
#[fg=#7e9cd8,bg=#1f1f27] #{prefix_highlight} \
#[fg=#1f1f27,bg=#1f1f27,nobold,nounderscore,noitalics]\
#[fg=#7e9cd8,bg=#1f1f27] %Y-%m-%d  %I:%M %p \
#[fg=#7e9cd8,bg=#1f1f27,nobold,nounderscore,noitalics]\
#[fg=#1f1f27,bg=#7e9cd8,bold] #h "

if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "\
#{prefix_highlight} \
#[fg=#1f1f27,bg=default,nobold,nounderscore,noitalics]\
#[fg=#DCD7BA,bg=#1f1f27] %Y-%m-%d | %H:%M \
#[fg=#DCD7BA,bg=#1f1f27,nobold,nounderscore,noitalics]\
#[fg=#1f1f27,bg=#DCD7BA,bold] #h "
}

# window‐status for inactive windows
setw -g window-status-activity-style "underscore,fg=#9cabca,bg=#1f1f28"
setw -g window-status-separator " "
setw -g window-status-style "NONE,fg=#9cabca,bg=default"
setw -g window-status-format "\
#[fg=#1f1f28,bg=default,nobold,nounderscore,noitalics]\
#[fg=#C8C093,bg=#1f1f27,bold] #I #W #F \
#[fg=#1f1f28,bg=default,nobold,nounderscore,noitalics]"

# window‐status for current (active) window
setw -g window-status-current-format "\
#[fg=#1f1f27,bg=default,nobold,nounderscore,noitalics]\
#[fg=#DCD7BA,bg=#1f1f27,bold] #I #W #F \
#[fg=#1f1f27,bg=default,nobold,nounderscore,noitalics]"

# tmux‐plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "\
#[fg=#dca561]#[bg=#1f1f28]\
#[fg=#1f1f28]#[bg=#dca561]"
set -g @prefix_highlight_output_suffix ""
