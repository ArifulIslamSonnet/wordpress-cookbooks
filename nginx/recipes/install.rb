#
# Cookbook:: nginx
# Recipe:: install
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package "nginx" do 
	action [:install,:enable, :start] 
end 
