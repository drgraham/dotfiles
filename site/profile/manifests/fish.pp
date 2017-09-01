# Configure fish
class profile::fish {

  file { "/home/${::id}/.config/fish/config.fish":
    ensure => file,
    source => 'puppet:///modules/profile/config.fish',
  }

  file { "/home/${::id}/.config/fish/functions":
    ensure => directory,
    mode   => '0755',
  }

  file { "/home/${::id}/.config/fish/functions/ffupdate.fish":
    ensure  => file,
    source  => 'puppet:///modules/profile/ffupdate.fish',
    require => File["/home/${::id}/.config/fish/functions"],
  }

  file { "/home/${::id}/.config/fish/functions/fontupdate.fish":
    ensure  => file,
    source  => 'puppet:///modules/profile/fontupdate.fish',
    require => File["/home/${::id}/.config/fish/functions"],
  }

  file { "/home/${::id}/.config/fish/functions/padump.fish":
    ensure  => file,
    source  => 'puppet:///modules/profile/padump.fish',
    require => File["/home/${::id}/.config/fish/functions"],
  }

}
