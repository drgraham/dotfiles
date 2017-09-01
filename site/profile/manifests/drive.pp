# Configure drive
class profile::drive {

  file { "/home/${::id}/GDrive":
    ensure => directory,
    mode   => '0755',
  }

  exec { 'makedrive':
    command => 'fish -c "go get -v -u github.com/odeke-em/drive/cmd/drive"',
    creates => "/home/${::id}/.local/go/bin/drive",
    require => File["/home/${::id}/.config/fish/config.fish"],
  }

}
