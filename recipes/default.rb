puts '##################### chef_conf #####################'
puts node['chef_conf']
puts '##################### chef_conf #####################'

chef_conf = node[:chef_conf]
chef_conf['packages'].each do |package_name|
  apt_package package_name do
    action :install
  end
end

include_recipe 'rainbox::ruby'      if chef_conf.fetch('languages', {}).keys.include?('ruby')
include_recipe 'golang'             if chef_conf.fetch('languages', {}).keys.include?('golang')


if chef_conf.fetch('databases', {}).include?('postgres')
  #template '/etc/profile.d/lang.sh' do
  #  source  'lang.sh.erb'
  #  mode '0644'
  #end
  #
  #execute 'locale-gen' do
  #  command 'locale-gen en_US.UTF-8'
  #end
  #
  #execute 'dpkg-reconfigure-locales' do
  #  command 'dpkg-reconfigure locales'
  #end
  include_recipe 'postgresql::server'
end
