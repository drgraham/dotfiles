# Configure fonts
class profile::fonts {

  $fontdir = "/home/${::id}/.local/share/fonts"

  file { $fontdir:
    ensure => directory,
    mode   => '0755',
  }

  file { '/tmp/fonts':
    ensure => directory,
    mode   => '0755',
  }

  Archive {
    extract_path => '/tmp/fonts',
    require => [
      File[$fontdir],
      File['/tmp/fonts'],
    ],
  }

  # http://www.blambot.com/font_backissues.shtml
  archive { '/tmp/backissuesbb_tt.zip':
    ensure  => present,
    extract => true,
    source  => 'http://www.blambot.com/_fonts/backissuesbb_tt.zip',
    creates => '/tmp/fonts/BackIssuesBB_reg.ttf',
    notify  => Exec['copyfonts'],
  }

  # https://www.dafont.com/komika-title.font
  archive { '/tmp/komika_title.zip':
    ensure  => present,
    extract => true,
    source  => 'https://dl.dafont.com/dl/?f=komika_title',
    creates => '/tmp/fonts/KOMTITTL.ttf',
    notify  => Exec['copyfonts'],
  }

  # https://www.dafont.com/yikes.font
  archive { '/tmp/yikes.zip':
    ensure  => present,
    extract => true,
    source  => 'https://dl.dafont.com/dl/?f=yikes',
    creates => '/tmp/fonts/YIKES!__.TTF',
    notify  => Exec['copyfonts'],
  }

  # https://www.dafont.com/fakehieroglyphs.font
  archive { '/tmp/fakehieroglyphs.zip':
    ensure  => present,
    extract => true,
    source  => 'https://dl.dafont.com/dl/?f=fakehieroglyphs',
    creates => '/tmp/fonts/FakeGlyph.otf',
    notify  => Exec['copyfonts'],
  }

  # http://www.impallari.com/projects/update/85
  archive { "${fontdir}/Domine.zip":
    ensure  => present,
    extract => true,
    source  =>
      'https://fonts.google.com/download?family=Domine',
    creates => '/tmp/fonts/Domine-Regular.ttf',
    notify  => Exec['copyfonts'],
  }

  # http://www.shyfoundry.com/fonts/shareware/sfvipersqu.html
  archive { '/tmp/sfvipersqu.zip':
    ensure  => present,
    extract => true,
    source  => 'http://www.shyfoundry.com/fonts/download/win/sfvipersqu.zip',
    creates => '/tmp/fonts/TrueType/SFViperSquadron.ttf',
    notify  => Exec['copyfonts'],
  }

  # https://www.behance.net/gallery/31261857/LAZER-84-Free-Font
  archive { "${fontdir}/Lazer84.ttf":
    ensure  => present,
    extract => false,
    source  => 'http://sunrise-digital.net/Lazer84.ttf',
    cleanup => false,
    notify  => Exec['copyfonts'],
  }

  exec { 'copyfonts':
    command     =>
      "find /tmp/fonts \( -iname '*.ttf' -o -iname '*.otf' \) -exec cp {} ${fontdir} \\; 2>/dev/null",
    refreshonly => true,
    notify      => Exec['fontupdate'],
  }

  exec { 'fontupdate':
    command     => 'fish -c "fontupdate"',
    refreshonly => true,
    require     => File["/home/${::id}/.config/fish/functions/fontupdate.fish"],
  }

}
