# Configure youtube-dl
class profile::youtubedl {

  archive { "/home/${::id}/.local/bin/youtube-dl":
    ensure  => present,
    extract => false,
    source  => 'https://yt-dl.org/downloads/latest/youtube-dl',
    cleanup => false,
    require => File["/home/${::id}/.local/bin"],
  }

  file { "/home/${::id}/.local/bin/youtube-dl":
    ensure  => file,
    mode    => '0755',
    require => Archive["/home/${::id}/.local/bin/youtube-dl"],
  }

}
