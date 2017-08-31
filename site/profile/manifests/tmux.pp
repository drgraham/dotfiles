# Configure tmux
class profile::tmux {

  file { "/home/$::id/.tmux.conf":
    content => "set -g mouse on\nset -g default-terminal \"screen-256color\"\n",
  }

}
