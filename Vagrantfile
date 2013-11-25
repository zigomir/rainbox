Vagrant.configure('2') do |config|
  config.vm.box     = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--name',  'rainbox']
    vb.customize ['modifyvm', :id, '--memory', 512]
  end

  config.vm.synced_folder '.', '/vagrant', nfs: (RUBY_PLATFORM =~ /linux/ or RUBY_PLATFORM =~ /darwin/)
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :private_network, ip: '192.168.1.10'

  # Set the Timezone and locale
  config.vm.provision :shell, :inline => "echo Europe/Ljubljana | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
  config.vm.provision :shell, :inline => 'locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8'
  config.vm.provision :shell, :inline => 'apt-get update --fix-missing'

  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
      chef.add_recipe "postgresql::server"
      chef.add_recipe "postgresql::ruby" # this one is needed for postgres-conf which will create new database
      chef.add_recipe "database"
      chef.add_recipe "postgres-conf"

      chef.json = {
        'postgresql' => {
          'config' => {
            'listen_addresses' => '*'
          },
          'initdb_locale' => 'en_US.UTF-8',
          'pg_hba' => [{:type => 'host', :db => 'all', :user => 'all', :addr => 'all', :method => 'md5'}],
          'password' => {
            'postgres' => 'postgres'
          }
        }
      }
  end
end
