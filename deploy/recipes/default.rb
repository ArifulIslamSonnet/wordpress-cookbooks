# Cookbook:: deploy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


app = search(:aws_opsworks_app).first
app_path = "/mnt/web"

package "git" do
  options "--force-yes" if node["platform"] == "ubuntu" && node["platform_version"] == "16.04"
end

application app_path do
  javascript "4"
  environment.update("PORT" => "80")
  environment.update(app["environment"])

  git app_path do
    repository app["app_source"]["url"]
    revision app["app_source"]["revision"]
  end
end
