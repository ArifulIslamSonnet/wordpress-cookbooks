#
# Cookbook:: nginx
# Recipe:: install
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package "nginx" 

service 'nginx' do
  action [:enable, :start]
end

