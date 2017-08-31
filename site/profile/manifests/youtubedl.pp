# Configure youtube-dl
class profile::youtubedl {

  exec { 'youtube-dl':
    command =>
      "wget -nc -P /home/$::id/.local/bin https://yt-dl.org/downloads/latest/youtube-dl",
    creates => "/home/$::id/.local/bin/youtube-dl",
    require => File["/home/$::id/.local/bin"],
  }

  file { "/home/$::id/.local/bin/youtube-dl":
    ensure  => file,
    mode    => '0755',
    require => Exec['youtube-dl'],
  }

}
