# dconf write
define profile::dconfwrite ($value) {
  exec { "dconf write ${title}":
    command => "dconf write ${title} \"${value}\"",
    unless  => "dconf read ${title} | grep \"${value}\"",
  }
}
