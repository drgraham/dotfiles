set -e fish_greeting

set -x EDITOR vim
set -x VISUAL vim
set -x TERM xterm
set -x GTK_IM_MODULE xim
set -x QT_IM_MODULE xim

set PATH $PATH $HOME/.local/bin

alias vi="vim"
alias xfterm="xfce4-terminal"
