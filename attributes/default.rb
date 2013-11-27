default[:rainbox][:database][:dbname] = 'development'
default['postgresql']['config']['listen_addresses'] = '*'
default['postgresql']['initdb_locale'] = 'en_US.UTF-8'
default['postgresql']['pg_hba'] = [
  {:type => 'host', :db => 'all', :user => 'all', :addr => 'all', :method => 'md5'}
]
default['postgresql']['password']['postgres'] = 'postgres'