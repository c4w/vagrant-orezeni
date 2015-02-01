# encoding: utf-8
# vim: ft=ruby expandtab shiftwidth=2 tabstop=2

Vagrant.configure(2) do |config|

  config.vm.box = 'ubuntu/trusty64'

  config.vm.network :private_network, ip: '192.168.111.222'

  config.vm.synced_folder 'www', '/var/www',
        create: true, owner: "vagrant", group: "vagrant"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = [
      File.join(File.dirname(__FILE__), 'provision/cookbooks'),
      File.join(File.dirname(__FILE__), 'provision/site-cookbooks')
    ]

    chef.json = {
      :orezeni => {
        :repository => 'https://github.com/orezeni/orezeni.github.com.git'
      }
    }

    chef.add_recipe "orezeni"
  end
end
