class java::install {

  file { "${::java::local_src_dir}/${::java::pkg_file}":
    ensure => file,
    source => "puppet:///modules/java/${::java::pkg_file}",
  }

  package { "$::java::pkg_name":
    ensure   => present,
    provider => rpm,
    source   => "${::java::local_src_dir}/${::java::pkg_file}"
  }

  file { "$::java::sys_lib_path/$::java::jli_lib":
    ensure => link,
    target => $::java::lib_jli
  }

}
