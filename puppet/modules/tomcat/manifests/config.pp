class tomcat::config {

  File {
    owner   => "tomcat",
    group   => "nobody",
    mode    => "0600",
    require => Class["tomcat::install"],
    notify  => Class["tomcat::service"],
    ensure  => "present",
  }

  file { "/opt/tomcat/conf/server.xml":
    content => template("tomcat/server.xml.erb"),
  }

  file { "/opt/tomcat/conf/context.xml":
    content => template("tomcat/context.xml.erb"),
  }

  file { "/opt/tomcat/conf/tomcat-users.xml":
    content => template("tomcat/tomcat-users.xml.erb"),
  }

  file { "/opt/tomcat/bin/setenv.sh":
    content => template("tomcat/setenv.sh.erb"),
  }

}
