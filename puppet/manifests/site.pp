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
    mysql_datasource_host       => 'localhost',
    mysql_datasource_dbname     => 'grannydb',
    mysql_datasource_username   => 'demo',
    mysql_datasource_password   => 'demodemo',
  }
  class { 'tomcat::install': }
  class { 'tomcat::config': }
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

  # Mysql server configuration with custom options for my.cnf,
  # with an example of changing the bind address
  $override_options = {
    'mysqld' => {
      'bind-address' => '172.21.10.2'
    }
  }
  class { '::mysql::server':
    root_password            => 'planet!0rbit@l',
    remove_default_accounts  => true,
    override_options         => $override_options,
  }

  # Create database for the Address Book app
  mysql::db { 'grannydb':
    user     => 'demo',
    password => 'demodemo',
    host     => 'localhost',
    grant    => ['SELECT', 'INSERT', 'UPDATE', 'DELETE'],
  }

  # Firewall rules
  firewall { '000 accept all icmp requests':
    proto  => 'icmp',
    action => 'accept',
  }

}
