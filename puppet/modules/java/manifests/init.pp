#
# == Class: java
#
# Installs and configures Java
#
# - A basic module to install Java
# - Uses the Java RPM package supplied with the module, as intended
#   only for test environments in which a Yum repo is not setup.
#
# === Author
#
# Pete Cornell <peter.cornell@me.com>
#
class java (

  $distribution  = $::java::params::distribution,
  $version       = $::java::params::version,
  $release       = $::java::params::release,
  $platform      = $::java::params::platform,
  $arch          = $::java::params::arch,
  $local_src_dir = $::java::params::local_src_dir

) inherits ::java::params {

  $pkg_file     = "$::java::params::pkg_file"
  $pkg_name     = "$::java::params::pkg_name"
  $sys_lib_path = "$::java::params::sys_lib_path"
  $lib_jli      = "$::java::params::jli_lib_path/$::java::params::jli_lib"
  $jli_lib      = "$::java::params::jli_lib"

  include '::java::install'

}
