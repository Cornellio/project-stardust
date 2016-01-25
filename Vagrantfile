# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant environment for "Address book" Java app
#
# These Vagrant plugins may be helpful for this project:
# - vagrant-cachier, will cache package downloads
# - vagrant-vbguest, will reinstall virtualbox guest additions as necessary
# To install those, run:
# vagrant plugin install vagrant-vbguest vagrant-cachier

Vagrant.configure("2") do |config|

  if defined? VagrantPlugins::Cachier
    config.cache.auto_detect = true
  end

  # system tuning for VirtualBox:
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "756", "--cpus", "2", "--ioapic", "on"]
  end

  # Puppet configuration to support modules and node definitions:
  # config.vm.provision "shell", inline: "puppet module install puppetlabs-stdlib"

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.module_path = "puppet/modules"
  end

  # Setup multiple machines to resemble a production deployment:

  domain = 'stardust.net'
  rhel_box = 'puppetlabs/centos-6.6-64-puppet-enterprise'

  config.vm.define "app" do |node|
    node.vm.box = rhel_box
    node.vm.network :private_network, ip: "172.16.10.2", :netmask => "255.255.0.0"
    node.vm.hostname = "app" + "." + domain
  end

  config.vm.define "db" do |node|
    node.vm.box = rhel_box
    node.vm.network :private_network, ip: "172.16.10.3", :netmask => "255.255.0.0"
    node.vm.hostname = "db"  + "." + domain
  end

end
