class ssh::install {

  package { $::ssh::package_name:
    ensure => installed,
  }

}
