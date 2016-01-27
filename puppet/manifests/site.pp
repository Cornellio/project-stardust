# Node definitions
#
node default {
  include stdlib
}

node 'app01' {

  class { 'java': }->
  class { 'tomcat::params':
    http_connector_port         => '9000',
    mysql_datasource_name       => 'MySqlGBDS',
    mysql_datasource_host       => '172.21.10.2',
    mysql_datasource_dbname     => 'grannydb',
    mysql_datasource_username   => 'demo',
    mysql_datasource_password   => 'demodemo',
  }->
  class { 'tomcat::install': }->
  class { 'tomcat::config': }->
  class { 'tomcat::service': }

  include'nginx'

  nginx::resource::upstream { 'app01.stardust.net':
    members => [
      'localhost:9000',
    ],
  }
  nginx::resource::vhost { 'www.stardust.net':
    proxy => 'http://app01.stardust.net',
  }

  # Mysql configuration
  # Custom options for my.cnf,
  # with example of setting the bind address
  #
  $override_options = {
    'mysqld' => {
      'bind-address' => '172.21.10.2'
    }
  }
  class { '::mysql::server':
    root_password            => 'planet!0rbit@l',
    remove_default_accounts  => false,
    override_options         => $override_options,
  }

  # Create database and user for Address Book app
  mysql::db { 'grannydb':
    user     => 'demo',
    password => 'demodemo',
    host     => '172.21.10.2',
    grant    => 'ALL',
  }

}
