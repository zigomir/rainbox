require 'yaml'

_config = YAML.load(File.open('vagrantconfig.yml'))
begin
  _config = YAML.load(File.open('vagrantconfig_local.yml'))
  rescue Errno::ENOENT
end
CONF = _config

Vagrant.configure('2') do |config|
  config.vm.box     = CONF['box_name']
  config.vm.box_url = CONF['box_url']
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--name',  CONF['project_name']]
    vb.customize ['modifyvm', :id, '--memory', 512]
  end

  config.vm.synced_folder '.', '/vagrant', nfs: (RUBY_PLATFORM =~ /linux/ or RUBY_PLATFORM =~ /darwin/)
  CONF['ports'].each do |port|
    config.vm.network :forwarded_port, guest: port['guest'], host: port['host']
  end
  config.vm.network :private_network, ip: CONF['guest_ip']

  config.vm.provision :shell, :inline => 'echo Europe/Ljubljana | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata'
  config.vm.provision :shell, :inline => 'apt-get update --fix-missing'
  config.vm.provision :shell, :inline => 'cp /vagrant/files/default/lang.sh /etc/profile.d/lang.sh'

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.run_list = ['recipe[rainbox::default]']
    chef.json = { chef_conf: CONF['chef_conf'] }
  end
end
