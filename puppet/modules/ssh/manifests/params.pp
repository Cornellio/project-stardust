class ssh::params {

  $permit_root_login        = 'no'
  $password_authentication  = 'no'
  $allow_users              = undef
  $package_name             = 'openssh-server'
  $service_name             = 'sshd'
  $config_file              = '/etc/ssh/sshd_config'

}
