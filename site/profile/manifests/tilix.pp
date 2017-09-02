# Configure Tilix
class profile::tilix {

  profile::dconfwrite { '/com/gexperts/Tilix/focus-follow-mouse':
    value => true,
  }

  profile::dconfwrite { '/com/gexperts/Tilix/control-click-titlebar':
    value => true,
  }

}
