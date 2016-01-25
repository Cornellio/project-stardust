# Node definitions
#
node default {
  include stdlib
}

node 'app' {

  class { 'java': }->
  class { 'tomcat::params':
    http_connector_port         => '9000',
    mysql_datasource_name       => 'MySqlGBDS',
    mysql_datasource_host       => '172.16.10.3',
    mysql_datasource_dbname     => 'grannydb',
    mysql_datasource_username   => 'demo',
    mysql_datasource_password   => 'demodemo',
  }
  class { 'tomcat::install': }
  class { 'tomcat::config': }
  class { 'tomcat::service': }

  include 'mysql::server'

}

node 'db' {

  include 'mysql::server'

}
