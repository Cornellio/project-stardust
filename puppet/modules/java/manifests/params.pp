class java::params {

  $distribution   = 'jdk'
  $major_version  = '1'
  $minor_version  = '7'
  $release        = '79'
  $platform       = 'linux'
  $arch           = 'x64'
  $local_src_dir  = '/usr/local/src'

  $pkg_file       = "${distribution}-${minor_version}u${release}-${platform}-${arch}.rpm"
  $pkg_src_url    = "https://github.com/Cornellio/project-stardust/releases/download/v0.1/$pkg_file"
  $pkg_name       = "${distribution}-${major_version}.${minor_version}.0_${release}-fcs.x86_64"

  $jli_lib_path   = "/usr/java/${distribution}${major_version}.${minor_version}.0_${release}/lib/amd64/jli/"
  $sys_lib_path   = '/lib64'
  $jli_lib        = 'libjli.so'

}
