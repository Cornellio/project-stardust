# Node definitions

node default {
  include stdlib
}

node 'app' {

  class { 'java': }->
  class { 'tomcat::params':
    http_connector_port => '9000',
  }
  class { 'tomcat::install': }
  class { 'tomcat::config': }
  class { 'tomcat::service': }

  include '::mysql::server'

}

node 'db' {

  include '::mysql::server'

}
