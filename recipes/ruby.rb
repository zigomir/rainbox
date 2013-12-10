include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'

rbenv_ruby node[:rainbox][:ruby][:version]

rbenv_gem 'bundler' do
  ruby_version node[:rainbox][:ruby][:version]
end
