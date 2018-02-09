# Configure neovim
class profile::neovim {

  file { "/home/${::id}/.config/nvim":
    ensure => directory,
    mode   => '0755',
  }

  file { "/home/${::id}/.config/nvim/init.vim":
    source  => 'puppet:///modules/profile/init.vim',
    require => File["/home/${::id}/.config/nvim"],
  }

  archive { '/tmp/HEAD.tar.gz':
    ensure          => present,
    extract         => true,
    extract_command => 'tar xvf %s --strip-components=1',
    extract_path    => "/home/${::id}/.config/nvim",
    source          => 'https://github.com/rodjek/vim-puppet/archive/HEAD.tar.gz',
    creates         => "/home/${::id}/.config/nvim/syntax/puppet.vim",
    require         => File["/home/${::id}/.config/nvim"],
  }

  file { "/home/${::id}/.config/nvim/README.md":
    ensure  => absent,
    require => Archive['/tmp/HEAD.tar.gz'],
  }

}
