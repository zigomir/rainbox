default[:rainbox][:ruby][:version] = node[:chef_conf].fetch('languages', {}).fetch('ruby', {}).fetch('version', {})

# rbenv settings
default[:rbenv][:user]  = 'vagrant'
default[:rbenv][:group] = 'vagrant'

# apache2 settings
default['apache']['user']  = 'vagrant'
default['apache']['group'] = 'vagrant'

# postgres settings
default['postgresql']['config']['listen_addresses'] = '*'
default['postgresql']['pg_hba'] = [
  {:type => 'host', :db => 'all', :user => 'all', :addr => 'all', :method => 'md5'}
]
default['postgresql']['password']['postgres'] = 'postgres'
