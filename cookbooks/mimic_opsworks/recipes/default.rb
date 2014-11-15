directory "/var/lib/aws/opsworks/chef" do
  mode '0755'
  action :create
end
template "/var/lib/aws/opsworks/chef/2014-11-11-03-03-49-02.json" do
  source "json.erb"
end
