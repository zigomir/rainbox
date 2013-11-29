puts '##################### chef_conf #####################'
puts node['chef_conf']
puts '##################### chef_conf #####################'

chef_conf = node[:chef_conf]
chef_conf['packages'].each do |package_name|
  apt_package package_name do
    action :install
  end
end

include_recipe 'rainbox::ruby' if chef_conf.fetch('languages', {}).keys.include?('ruby')

if chef_conf.fetch('databases', {}).include?('postgres')
  include_recipe 'postgresql::server'
end
