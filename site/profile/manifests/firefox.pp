# Configure Firefox
class profile::firefox {

  $mime = 'text/html;text/xml;text/mml;'
  $mimeapp = 'application/xhtml+xml;application/vnd.mozilla.xul+xml;'
  $mimex = 'x-scheme-handler/http;x-scheme-handler/https;'

  exec { 'ffupdate':
    command => 'fish -c "ffupdate"',
    creates => "/home/${::id}/.local/firefox/firefox",
    require => File["/home/${::id}/.config/fish/functions/ffupdate.fish"],
  }

  Ini_setting {
    ensure            => present,
    key_val_separator => '=',
    path              => "/home/${::id}/.local/share/applications/firefox.desktop",
    section           => 'Desktop Entry',
    require           => [
      File["/home/${::id}/.local/share/applications"],
      Exec['ffupdate'],
    ],
    notify            => Exec['xdg-forceupdate'],
  }

  ini_setting {

    'ff-version':
      setting => 'Version',
      value   => '1.0',;

    'ff-name':
      setting => 'Name',
      value   => 'Firefox',;

    'ff-genericname':
      setting => 'GenericName',
      value   => 'Web Browser',;

    'ff-comment':
      setting => 'Comment',
      value   => 'Browse the Web',;

    'ff-terminal':
      setting => 'Terminal',
      value   => false,;

    'ff-type':
      setting => 'Type',
      value   => 'Application',;

    'ff-mimetype':
      setting => 'MimeType',
      value   => "${mime}${mimeapp}${mimex}",;

    'ff-startupnotify':
      setting => 'StartupNotify',
      value   => true,;

    'ff-categories':
      setting => 'Categories',
      value   => 'Network;WebBrowser;',;

    'ff-keywords':
      setting => 'Keywords',
      value   => 'web;browser;internet;',;

    'ff-exec':
      setting => 'Exec',
      value   => "/home/${::id}/.local/firefox/firefox %u",;

    'ff-icon':
      setting => 'Icon',
      value   => "/home/${::id}/.local/firefox/browser/icons/mozicon128.png",;

  }

}
