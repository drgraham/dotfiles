# Dotfile setup
class role::dotfiles {

  include profile::adb
  include profile::base
  include profile::drive
  include profile::firefox
  include profile::fish
  include profile::fonts
  include profile::most
  include profile::ranger
  include profile::tmux
  include profile::youtubedl

}
