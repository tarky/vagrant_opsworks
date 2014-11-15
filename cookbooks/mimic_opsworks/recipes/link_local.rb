link "/srv/www/#{node['app_name']}/current" do
  action :delete
end
link "/srv/www/#{node['app_name']}/current" do
  to "/vagrant"
end
# I don't know why the following causes Bundler::GemfileNotFound.
# execute 'cd /srv/www/#{node['app_name']}/current; bundle install' do
#   user "deploy"
# end
