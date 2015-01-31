# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = 'ubuntu/trusty64'

  config.vm.network :private_network, ip: '192.168.111.222'

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = [
      File.join(File.dirname(__FILE__), 'provision/cookbooks'),
      File.join(File.dirname(__FILE__), 'provision/site-cookbooks')
    ]
    chef.add_recipe "orezeni"
  end
end
