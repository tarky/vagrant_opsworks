link "/srv/www/#{node['app_name']}/current" do
  action :delete
end
link "/srv/www/#{node['app_name']}/current" do
  to "/vagrant"
end
execute "cd /srv/www/#{node['app_name']};cp -r releases/*/.bundle current"
bash "/srv/www/#{node['app_name']}/shared/scripts/unicorn restart"
