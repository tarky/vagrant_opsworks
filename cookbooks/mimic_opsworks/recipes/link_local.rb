link "/srv/www/#{node['app_name']}/current" do
  action :delete
end

link "/srv/www/#{node['app_name']}/current" do
  to "/vagrant"
end

include_recipe "mimic_opsworks::recreate_releases"

template "/srv/www/#{node['app_name']}/current/config/database.yml"

file "/srv/www/#{node['app_name']}/shared/config/unicorn.conf" do
  _file = Chef::Util::FileEdit.new(path)
  _file.search_file_replace('timeout 60', 'timeout 10000')
  _file.write_file
end

template "/etc/profile.d/for_dev.sh"

execute "cp -Rf /home/deploy/.bundler/#{node['app_name']}/. "\
  "/srv/www/#{node['app_name']}/current/vendor/bundle"

directory "/srv/www/#{node['app_name']}/current/.bundle"
cookbook_file "/srv/www/#{node['app_name']}/current/.bundle/config"
