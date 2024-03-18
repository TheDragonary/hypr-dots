#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias hyprconf='nvim ~/.config/hypr/hyprland.conf'
alias feh='feh -.'

export MANPAGER="nvim +Man!"

eval "$(starship init bash)"
pfetch
