Exec { path => '/usr/bin:/bin', }
File {
  owner  => $::id,
  group  => $::gid,
  mode   => '0644',
  backup => false,
}

node default {

  include role::dotfiles

}
