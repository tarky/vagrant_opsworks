link "/srv/www/#{node['app_name']}/current" do
  action :delete
end

link "/srv/www/#{node['app_name']}/current" do
  to "/vagrant"
end

execute "copy .bundle" do
  cwd "/srv/www/#{node['app_name']}"
  command "cp -r releases/*/.bundle current"
end

template "/srv/www/#{node['app_name']}/current/config/database.yml" 

bash "/srv/www/#{node['app_name']}/shared/scripts/unicorn restart"

template "/etc/profile.d/for_dev.sh"
