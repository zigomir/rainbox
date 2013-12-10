puts '##################### chef_conf #####################'
puts node['chef_conf']
puts '##################### chef_conf #####################'

chef_conf = node[:chef_conf]
chef_conf['packages'].each do |package_name|
  package package_name do
    action :install
  end
end

if chef_conf.fetch('databases', {}).include?('postgres')
  include_recipe 'postgresql::server'
end

if chef_conf.fetch('databases', {}).include?('sqlite3')
  package 'libsqlite3-dev' do
    action :install
  end
end

if chef_conf.fetch('languages', {}).keys.include?('ruby')
  include_recipe 'rainbox::ruby'
end
