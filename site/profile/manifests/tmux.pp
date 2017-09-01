# Configure tmux
class profile::tmux {

  file { "/home/${::id}/.tmux.conf":
    ensure => file,
    source => 'puppet:///modules/profile/tmux.conf',
  }

}
