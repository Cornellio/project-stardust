#
# == Class: security
#
# Configure TCP wrappers to enforce host based security
# for sshd via /etc/hosts.allow & /etc/hosts.deny
#
# === Author
#
# Pete Cornell <peter.cornell@me.com>
#
class security (

  $hosts_allow  = $::security::params::hosts_allow,
  $hosts_deny   = $::security::params::hosts_deny,
  $service      = $::security::params::service,
  $allow        = $::security::params::allow,
  $deny         = $::security::params::deny,

) inherits ::security::params {

  class { '::security::config': }

}
