class motd {
  file { '/etc/motd':
    ensure  => present,
    content => "ziggy stardust was there",
  }
}
