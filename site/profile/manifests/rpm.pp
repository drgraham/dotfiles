# Configure rpmbuild
class profile::rpm {

  file { "/home/${::id}/.rpmmacros":
    content => "%_topdir /home/${::id}/Development/rpmbuild",
    require => File["/home/${::id}/Development"],
  }

}
