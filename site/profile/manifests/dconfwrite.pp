# dconf write
define profile::dconfwrite ($value) {
  exec { "dconf write ${title}":
    provider => shell,
    command  => "dconf write ${title} \"${value}\"",
    unless   => "if [ \"$(dconf read ${title})\" != \"${value}\" ]; then exit 1; fi",
  }
}
