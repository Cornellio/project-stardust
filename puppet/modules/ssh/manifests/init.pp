#
# == Class: ssh
#
# Installs and configures openssh-server
#
# === Author
#
# Pete Cornell <peter.cornell@me.com>
#
class ssh (

  $permit_root_login        = $::ssh::params::permit_root_login,
  $password_authentication  = $::ssh::params::password_authentication,
  $allow_users              = $::ssh::params::allow_users,

) inherits ::ssh::params {

  class { '::ssh::install': }->
  class { '::ssh::config': }~>
  class { '::ssh::service': }

}
