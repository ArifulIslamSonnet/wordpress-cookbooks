#
# Cookbook:: deploy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

app = search(:aws_opsworks_app).first
app_path = "/mnt/web"

package "git" do
  options "--force-yes" if node["platform"] == "ubuntu" && node["platform_version"] == "16.04"
end

# deploy git repo from opsworks app
application app_path do
  git app_path do
    repository app['app_source']['url']
    revision app["app_source"]["revision"]
    deploy_key app['app_source']['ssh_key']
  end
end
