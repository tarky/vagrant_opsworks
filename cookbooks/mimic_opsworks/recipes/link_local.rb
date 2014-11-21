link "/srv/www/#{node['app_name']}/current" do
  action :delete
end
link "/srv/www/#{node['app_name']}/current" do
  to "/vagrant"
end
execute "copy configs" do
  cwd "/srv/www/#{node['app_name']}"
  command <<-EOH
    cp -r releases/*/.bundle current;
    cp releases/*/config/database.yml current/config;
  EOH
end
bash "/srv/www/#{node['app_name']}/shared/scripts/unicorn restart"
