set -e fish_greeting

set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER most
set -x MANPAGER most
set -x DE gnome
set -x BROWSER $HOME/.local/firefox/firefox
set -x GTK_IM_MODULE xim
set -x QT_IM_MODULE xim
set -x GOPATH $HOME/.local/go
set -x GEM_HOME $HOME/.local/gems
set -x GEM_SPEC_CACHE $GEM_HOME/specs

set PATH $PATH $HOME/.local/bin $GOPATH/bin $GEM_HOME/bin

[ $COLORTERM ]
and [ $TERM != "screen-256color" ]
and set -x TERM xterm-256color
