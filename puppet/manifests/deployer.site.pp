# Node definitions

node default {
  include stdlib
}

node 'deployer' {

  class { 'java': }->
  class { 'tomcat::params':
    http_connector_port => '8080',
  }->
  class { 'tomcat::install': }->
  class { 'tomcat::config': }->
  class { 'tomcat::service': }

  # Firewall rules
  # Only allow inbound SSH and HTTP
  #
  resources { 'firewall':
    purge => true,
  }

  Firewall {
    before  => Class['firewall::post'],
    require => Class['firewall::pre'],
  }

  class { ['firewall::pre', 'firewall::post']: }

  class { 'firewall': }

  firewall { '004 Allow inbound SSH':
    dport   => 22,
    proto   => tcp,
    action  => accept,
  }->
  firewall { '005 Allow inbound Jenkins':
    dport   => 8080,
    proto   => tcp,
    action  => accept,
  }
}
