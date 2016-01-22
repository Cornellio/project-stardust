# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant environment for "Address book" Java app
#
# Useful Vagrant plugins include:
# - vagrant-cachier, will cache package downloads
# - vagrant-vbguest, will reinstall virtualbox guest additions as necessary
# To install those, run:
# vagrant plugin install vagrant-vbguest vagrant-cachier

Vagrant.configure("2") do |config|

  if defined? VagrantPlugins::Cachier
    config.cache.auto_detect = true
  end

  # system tuning:
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "756", "--cpus", "2", "--ioapic", "on"]
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.module_path = "puppet/modules"
  end

  # multi-machine configs:

  config.vm.define "web" do |node|
    node.vm.box = "puppetlabs/centos-6.6-64-puppet-enterprise"
    node.vm.network :private_network, ip: "172.28.128.2", :netmask => "255.255.0.0"
    node.vm.hostname = "web"
  end

  config.vm.define "db" do |node|
    node.vm.box = "puppetlabs/centos-6.6-64-puppet-enterprise"
    node.vm.network :private_network, ip: "172.28.128.3", :netmask => "255.255.0.0"
    node.vm.hostname = "db"
  end

end
