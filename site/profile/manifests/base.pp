# Configure basic stuff
class profile::base {

  file { "/home/${::id}/.local/bin":
    ensure => directory,
    mode   => '0755',
  }

  file { "/home/${::id}/.local/share":
    ensure => directory,
    mode   => '0700',
  }

  file { "/home/${::id}/.local/share/applications":
    ensure  => directory,
    mode    => '0700',
    require => File["/home/${::id}/.local/share"],
  }

  file { "/home/${::id}/Pictures":
    ensure => directory,
    mode   => '0755',
  }

  archive { "/home/${::id}/Pictures/PIA02991.tif":
    ensure  => present,
    extract => false,
    source  => 'http://photojournal.jpl.nasa.gov/tiff/PIA02991.tif',
    cleanup => false,
    require => File["/home/${::id}/Pictures"],
  }

  exec { 'PIA02991.png':
    command =>
      "convert /home/${::id}/Pictures/PIA02991.tif /home/${::id}/Pictures/PIA02991.png",
    creates => "/home/${::id}/Pictures/PIA02991.png",
    require => Archive["/home/${::id}/Pictures/PIA02991.tif"],
  }

  vcsrepo { '/tmp/neon-84':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/jayk/neon-84.git',
  }

  file { "/home/${::id}/Pictures/grid-mountains-2.png":
    source  => '/tmp/neon-84/wallpaper/grid-mountains-2.png',
    require => [
      File["/home/${::id}/Pictures"],
      Vcsrepo['/tmp/neon-84'],
    ],
  }

  exec { 'xdg-forceupdate':
    command     => 'xdg-desktop-menu forceupdate',
    refreshonly => true,
  }

}
