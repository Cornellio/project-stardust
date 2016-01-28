class tomcat::install {

  $default_webapps_dirs = [
    '/opt/tomcat/webapps/docs',
    '/opt/tomcat/webapps/examples',
    '/opt/tomcat/webapps/host-manager',
    '/opt/tomcat/webapps/manager',
    '/opt/tomcat/webapps/ROOT' ]

  # Remove default tomcat webapps
  file { [$default_webapps_dirs]:
    ensure    => "absent",
    recurse   => "true",
    force     => "true",
    subscribe => Exec["extract-tomcat-pkg"],
  }

  file { "/etc/init.d/tomcat":
    ensure => "present",
    owner  => 0,
    group  => "wheel",
    mode   => '0755',
    notify => Service["tomcat"],
    source => [ "puppet:///modules/tomcat/tomcat-init.${::hostname}",
                "puppet:///modules/tomcat/tomcat-init" ],
  }

  user { "tomcat":
    comment => "Tomcat JVM user",
    home    => "/opt/tomcat/temp",
    ensure  => "present",
    shell   => "/bin/bash",
    uid     => '1504',
    gid     => '99'
  }

  wget::fetch { "tomcat-pkg":
    source      => 'https://github.com/Cornellio/project-stardust/releases/download/v0.1/apache-tomcat-7.0.42.tar.gz',
    destination => '/usr/local/src/apache-tomcat-7.0.42.tar.gz',
    timeout     => 0,
    verbose     => false,
    before      => Exec["extract-tomcat-pkg"],
  }

  exec { "extract-tomcat-pkg":
    command       => "/bin/mkdir /opt/tomcat && /bin/tar -xzf /usr/local/src/apache-tomcat-7.0.42.tar.gz -C /opt/ && /bin/chown -R tomcat:nobody /opt/tomcat && /bin/mkdir -p /var/log/tomcat && /bin/chown tomcat:nobody /var/log/tomcat && /bin/sleep 7",
    path          => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
    refreshonly   => "false",
    creates       => "/opt/tomcat",
  }

  exec { "chkconfig":
    command => "/sbin/chkconfig --level 2345 tomcat on",
    unless  => "/sbin/chkconfig | /bin/grep 'tomcat.*[2-5]:on'",
    path    => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
    require => File["/etc/init.d/tomcat"],
  }
}
