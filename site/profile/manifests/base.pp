# Configure basic stuff
class profile::base {

  file { "/home/$::id/.local/bin":
    ensure => directory,
    mode   => '0755',
  }

  file { "/home/$::id/.local/share":
    ensure => directory,
    mode   => '0700',
  }

  file { "/home/$::id/.local/share/applications":
    ensure  => directory,
    mode    => '0700',
    require => File["/home/$::id/.local/share"],
  }

  file { "/home/$::id/Pictures":
    ensure => directory,
    mode   => '0755',
  }

  exec { 'PIA02991.tif':
    command =>
      "wget -nc -P /home/$::id/Pictures http://photojournal.jpl.nasa.gov/tiff/PIA02991.tif",
    creates => "/home/$::id/Pictures/PIA02991.tif",
    require => File["/home/$::id/Pictures"],
  }

  exec { 'PIA02991.png':
    command =>
      "convert /home/$::id/Pictures/PIA02991.tif /home/$::id/Pictures/PIA02991.png",
    creates => "/home/$::id/Pictures/PIA02991.png",
    require => Exec['PIA02991.tif'],
  }

}
