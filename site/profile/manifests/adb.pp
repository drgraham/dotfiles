# Configure Android Debug Bridge
class profile::adb {

  archive { '/tmp/platform-tools-latest-linux.zip':
    ensure       => present,
    extract      => true,
    extract_path => "/home/$::id/.local",
    source       =>
      'https://dl.google.com/android/repository/platform-tools-latest-linux.zip',
    creates      => "/home/$::id/.local/platform-tools/adb",
  }

  file { "/home/$::id/.local/bin/adb":
    ensure  => link,
    target  => "/home/$::id/.local/platform-tools/adb",
    require => [
      File["/home/$::id/.local/bin"],
      Archive['/tmp/platform-tools-latest-linux.zip'],
    ],
  }

}
