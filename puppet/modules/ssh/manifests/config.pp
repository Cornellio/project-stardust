class ssh::config {

  file { $::ssh::config_file:
    ensure  => file,
    mode    => 600,
    content => template("ssh/sshd_config.erb"),
  }

}
