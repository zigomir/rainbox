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
  config.vm.provision :shell, :inline => 'echo Europe/Ljubljana | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata'
  config.vm.provision :shell, :inline => 'locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8'
  config.vm.provision :shell, :inline => 'apt-get update --fix-missing'

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
      chef.run_list = ['recipe[rainbox::default]']
  end
end
