['vim'].each do |package_name|
  apt_package package_name do
    action :install
  end
end

include_recipe 'rainbox::ruby'
include_recipe 'postgresql::server'
