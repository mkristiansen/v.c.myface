#
# Cookbook Name:: myface
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

group node['myface']['group']

user node['myface']['user'] do
  group node['myface']['group']
  system true
  shell '/bin/bash'
end

include_recipe 'apache2'
include_recipe 'apache2::mod_php5'

include_recipe 'php::module_mysql'

# disable default site
apache_site '000-default' do
  enable false
end

# create apache config
template "#{node['apache']['dir']}/sites-available/#{node['myface']['config']}" do  
  source 'apache2.conf.erb'
  notifies :restart, 'service[apache2]'
end

# create document root
directory "#{node['myface']['document_root']}" do
  action :create
  recursive true
end

# write site
template "#{node['myface']['document_root']}/index.php" do
  source 'index.php.erb'
  mode '0644'
end

# enable myface
apache_site "#{node['myface']['config']}" do
  enable true
end
