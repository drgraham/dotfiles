set -e fish_greeting

set -x EDITOR nvim
set -x VISUAL nvim
set -x TERM xterm
set -x PAGER most
set -x DE gnome
set -x BROWSER $HOME/.local/firefox/firefox
set -x GTK_IM_MODULE xim
set -x QT_IM_MODULE xim
set -x GOPATH $HOME/.local/go

set PATH $PATH $HOME/.local/bin $GOPATH/bin

alias xfterm="xfce4-terminal"
