class java::install {

  wget::fetch { "java-pkg":
    source      => "$::java::pkg_src_url",
    destination => "${::java::local_src_dir}/${::java::pkg_file}",
    timeout     => 0,
    verbose     => false,
    before      => Package["$::java::pkg_name"],
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
