class security::config {

  if ($::security::allow) != undef {
    file { $::security::hosts_allow:
      ensure  => file,
      content => template("security/hosts_allow.erb"),
    }
  }

  if ($::security::deny) != undef {
    file { $::security::hosts_deny:
      ensure  => file,
      content => template("security/hosts_deny.erb"),
    }
  }
}
