# dconf reset
define profile::dconfreset {
  exec { "dconf reset ${title}":
    provider => shell,
    command  => "dconf reset ${title}",
    unless   => "exit $(dconf read ${title} | wc -l)",
  }
}
