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

include_recipe "mimic_opsworks::recreate_releases"

template "/srv/www/#{node['app_name']}/current/config/database.yml" 

file "/srv/www/#{node['app_name']}/shared/config/unicorn.conf" do
  _file = Chef::Util::FileEdit.new(path)
  _file.search_file_replace('timeout 60', 'timeout 10000')
  _file.write_file
end

bash "/srv/www/#{node['app_name']}/shared/scripts/unicorn restart"

template "/etc/profile.d/for_dev.sh"
