# Configure mpv
class profile::mpv {

  file { "/home/${::id}/.config/mpv":
    ensure => directory,
    mode   => '0700',
  }

  file { "/home/${::id}/.config/mpv/scripts":
    ensure  => directory,
    mode    => '0755',
    require => File["/home/${::id}/.config/mpv"],
  }

  vcsrepo { '/tmp/mpv-tools':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/SteveJobzniak/mpv-tools.git'
  }

  file { "/home/${::id}/.config/mpv/scripts/quick-scale.lua":
    source  => '/tmp/mpv-tools/scripts/quick-scale.lua',
    require => [
      File["/home/${::id}/.config/mpv/scripts"],
      Vcsrepo['/tmp/mpv-tools'],
    ],
  }

  file { "/home/${::id}/.config/mpv/input.conf":
    content =>
      "Alt+9 script-message Quick_Scale \"${::resolution[0]}\" \"${::resolution[1]}\" \"1\" \"-1\"\n",
    require => File["/home/${::id}/.config/mpv"],
  }

  Ini_setting {
    ensure            => present,
    key_val_separator => '=',
    path              => "/home/${::id}/.config/mpv/mpv.conf",
    section           => 'default',
    require           => File["/home/${::id}/.config/mpv"],
  }

  ini_setting {

    'mpv-screenshot-format':
      setting => 'screenshot-format',
      value   => 'png',;

  }

}
