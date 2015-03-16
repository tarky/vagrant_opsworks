directory "/srv/www/#{node[:APP_NAME]}/releases" do
  recursive true
  action :delete
end
directory "/srv/www/#{node[:APP_NAME]}/releases" do
  mode '0755'
  action :create
end
