# Dotfile setup
class role::dotfiles {

  include profile::fish
  include profile::most
  include profile::ranger
  include profile::tmux

}
