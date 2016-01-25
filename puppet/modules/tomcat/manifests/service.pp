class tomcat::service {

  service { "tomcat":
    enable      => "true",
    ensure      => "running",
    hasrestart  => "true",
    hasstatus   => "true",
    subscribe   => Class["tomcat::config"],
  }

}
