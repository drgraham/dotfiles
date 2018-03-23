# Configure GNOME
class profile::gnome {

  $favorites = "['org.gnome.Nautilus.desktop', 'com.gexperts.Tilix.desktop', 'firefox.desktop', 'google-chrome.desktop', 'mousepad.desktop', 'org.keepassxc.KeePassXC.desktop']"

  profile::dconfwrite { '/org/gnome/desktop/background/picture-uri':
    value => "'file:///home/${::id}/Pictures/PIA02991.png'",
  }

  profile::dconfwrite { '/org/gnome/desktop/background/picture-options':
    value => "'zoom'",
  }

  profile::dconfwrite { '/org/gnome/desktop/wm/preferences/focus-mode':
    value => "'sloppy'",
  }

  profile::dconfwrite { '/org/gnome/shell/favorite-apps':
    value => $favorites,
  }

  profile::dconfwrite { '/org/gnome/system/location/enabled':
    value => false,
  }

  profile::dconfwrite { '/org/gnome/desktop/privacy/old-files-age':
    value => 'uint32 1',
  }

  profile::dconfwrite { '/org/gnome/desktop/privacy/remove-old-temp-files':
    value => true,
  }

  profile::dconfwrite { '/org/gnome/desktop/privacy/remove-old-trash-files':
    value => false,
  }

  profile::dconfwrite { '/org/gnome/desktop/privacy/report-technical-problems':
    value => false,
  }

  profile::dconfwrite { '/org/gnome/desktop/privacy/send-software-usage-stats':
    value => false,
  }

  profile::dconfwrite { '/org/gnome/desktop/input-sources/xkb-options':
    value => "['compose:ralt']",
  }

  profile::dconfwrite { '/org/gnome/software/download-updates':
    value => false,
  }

  profile::dconfwrite { '/org/gnome/settings-daemon/plugins/color/night-light-enabled':
    value => true,
  }

}
