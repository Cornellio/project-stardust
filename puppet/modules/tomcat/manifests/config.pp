class tomcat::config {

  File {
    owner   => "tomcat",
    group   => "nobody",
    mode    => "0600",
  }

  file { "/opt/tomcat/conf/server.xml":
    content => template("tomcat/server.xml.erb"),
    ensure  => "present",
    notify  => Service["tomcat"],
    require => Class["tomcat::install"],
  }

  file { "/opt/tomcat/conf/context.xml":
    ensure => "present",
    require => Class["tomcat::install"],
    content => template("tomcat/context.xml.erb"),
  }

  file { "/opt/tomcat/bin/setenv.sh":
    ensure  => "present",
    content => template("tomcat/setenv.sh.erb"),
    require => Class["tomcat::install"],
    notify  => Service["tomcat"],
  }

}
