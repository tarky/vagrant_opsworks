directory "/srv/www/#{node['app_name']}/releases" do
  recursive true
  action :delete
end
directory "/srv/www/#{node['app_name']}/releases" do
  mode '0755'
  action :create
end
