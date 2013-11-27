include_recipe 'postgresql::server'
include_recipe 'postgresql::ruby'
include_recipe 'database'

postgresql_database node[:rainbox][:database][:dbname] do
  connection(
    :host     => '127.0.0.1',
    :port     => 5432,
    :username => 'postgres',
    :password => node['postgresql']['password']['postgres']
  )
  action :create
end
