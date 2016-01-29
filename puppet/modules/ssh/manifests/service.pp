class ssh::service {

  service { $::ssh::service_name:
    enable      => true,
    ensure      => running,
  }

}
