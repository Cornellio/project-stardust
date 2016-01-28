class webapp::granny {

  wget::fetch { "granny.war":
    source      => "https://github.com/Cornellio/project-stardust/releases/download/v0.1/granny.war",
    destination => "/usr/local/src/granny.war",
    timeout     => 0,
    verbose     => false,
    require     => Class["tomcat::install"],
    before      => File["/opt/tomcat/webapps/granny.war"],
  }

  file { "/opt/tomcat/webapps/granny.war":
    source  => "/usr/local/src/granny.war",
    owner   => "tomcat",
    group   => "nobody",
    mode    => "0600",
    ensure  => "present",
  }


}
