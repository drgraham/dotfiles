# Configure most
class profile::most {

  file { "/home/${::id}/.mostrc":
    ensure => file,
    source => 'puppet:///modules/profile/mostrc',
  }

}
