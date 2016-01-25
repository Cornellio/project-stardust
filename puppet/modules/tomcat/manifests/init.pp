#
# == Class: tomcat
#
# Install and configure Tomcat 7
#
# - Focuses on best-practices as defined by Apache, SpringSource, and MuleSoft
# - Runs a single instance of Tomcat from /opt/tomcat
# - Supplies a system init script
#
# === Author
#
# Pete Cornell <peter.cornell@me.com>
#
class tomcat {
  class { 'tomcat::params': }
  class { 'tomcat::install': }
  class { 'tomcat::config': }
  class { 'tomcat::service': }
}
