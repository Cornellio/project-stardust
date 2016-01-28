# Node definitions

node default {
  include stdlib
}

node 'deployer' {

  class { java: }->
  class { ::jenkins: }
  class { ::jenkins::firewall: }

  jenkins::plugin { 'deploy':
    version => '1.10',
  }

}
