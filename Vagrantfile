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

  # Multi-machine definitions:

  domain = 'stardust.net'
  rhel_box = 'puppetlabs/centos-6.6-64-puppet-enterprise'

  config.vm.define "app01" do |node|
    node.vm.box = rhel_box
    node.vm.network :private_network, ip: "172.21.10.2", :netmask => "255.255.0.0"
    node.vm.hostname = "app01" + "." + domain
    # node.vm.network :forwarded_port, guest: 22, host: 2222

    config.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "app01.site.pp"
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
    end
  end

  config.vm.define "deployer" do |node|
    node.vm.box = rhel_box
    node.vm.network :private_network, ip: "172.21.10.21", :netmask => "255.255.0.0"
    node.vm.hostname = "deployer" + "." + domain
    # node.vm.network :forwarded_port, guest: 22, host: 2233

    config.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "deployer.site.pp"
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
    end
  end

end
