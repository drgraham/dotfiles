# Configure ranger
class profile::ranger {

  file { "/home/$::id/.config/ranger":
    ensure => directory,
    mode   => '0755',
  }

  file { "/home/$::id/.config/ranger/rc.conf":
    ensure  => file,
    source  => 'puppet:///modules/profile/ranger.conf',
    require => File["/home/$::id/.config/ranger"],
  }

}
