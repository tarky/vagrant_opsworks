# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end
  config.vm.box = "ubuntu1404-opsworks"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant", type: 'nfs'
  config.vm.provision "shell", inline: "apt-get update > /dev/null"
  config.vm.provision "chef_solo" do |chef|
    chef.run_list = ["mimic_opsworks::default"]
  end
  config.vm.provision "shell", inline: "opsworks-agent-cli run_command"
  config.vm.provision "chef_solo" do |chef|
    chef.run_list = ["mimic_opsworks::link_local"]
  end
  config.vm.provision "shell", inline:
    "rake db:create RAILS_ENV=test;"\
    "unicorn stop;"\
    "unicorn start"
end
