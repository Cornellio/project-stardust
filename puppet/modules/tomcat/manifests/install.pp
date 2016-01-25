class tomcat::install {

  $default_webapps_dirs = [
    '/opt/tomcat/webapps/docs',
    '/opt/tomcat/webapps/examples',
    '/opt/tomcat/webapps/host-manager',
    '/opt/tomcat/webapps/manager',
    '/opt/tomcat/webapps/ROOT' ]

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

  file { "tomcat-pkg":
    path      => "/usr/local/src/apache-tomcat-7.0.42.tar.gz",
    source    => "puppet:///modules/tomcat/apache-tomcat-7.0.42.tar.gz",
    ensure    => "file",
    owner     => "root",
    group     => "root",
    mode      => "0644",
  }

  exec { "extract-tomcat-pkg":
    command       => "/bin/mkdir /opt/tomcat && /bin/tar -xzf /usr/local/src/apache-tomcat-7.0.42.tar.gz -C /opt/ && /bin/chown -R tomcat:nobody /opt/tomcat && /bin/mkdir -p /var/log/tomcat && /bin/chown tomcat:nobody /var/log/tomcat && /bin/sleep 7",
    path          => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
    refreshonly   => "false",
    creates       => "/opt/tomcat",
    require       => File["tomcat-pkg"],
    subscribe     => File["tomcat-pkg"],
  }

  exec { "chkconfig":
    command => "/sbin/chkconfig --level 2345 tomcat on",
    unless  => "/sbin/chkconfig | /bin/grep 'tomcat.*[2-5]:on'",
    path    => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
    require => File["/etc/init.d/tomcat"],
  }

  # Setcap permits java to use privileged ports (1024 and below) when run as non-root user
  exec { "setcap-java-bin":
    command => "/usr/sbin/setcap cap_net_bind_service+ep /usr/java/default/bin/java",
    unless  => "/usr/sbin/getcap /usr/java/default/bin/java | /bin/grep -F cap_net_bind_service+ep",
  }
  exec { "setcap-java-lib":
    command => "/bin/echo $(/bin/find /usr/java -name jli -type d) > /etc/ld.so.conf.d/java-libjli.conf && /sbin/ldconfig -v > /dev/null 2>&1",
    creates => "/etc/ld.so.conf.d/java-libjli.conf",
  }

  # Remove Tomcat default webapps
  file { [$default_webapps_dirs]:
    ensure    => "absent",
    recurse   => "true",
    force     => "true",
    subscribe => Exec["extract-tomcat-pkg"],
  }

}
