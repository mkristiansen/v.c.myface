# Cookbook Name:: myface
# Recipe:: default
#
# Copyright (C) 2013 Morten Kristiansen
#
# All rights reserved - Do Not Redistribute
#

yum_globalconfig '/etc/yum.conf.chef' do
  action :delete
end

yum_globalconfig '/etc/yum.conf' do
  cachedir '/var/cache/yum/$basearch/$releasever'
  keepcache true
  exclude 'kernel'	
  debuglevel '2'
  logfile '/var/log/yum.log'
  exactarch=1
  obsoletes=1
  gpgcheck=1
  plugins=1
  installonly_limit=5
  bugtracker_url 'http://bugs.centos.org/set_project.php?project_id=16&ref=http://bugs.centos.org/bug_report_page.php?category=yum'
  distroverpkg 'centos-release'
  action :create
end

include_recipe 'myface::webserver'
include_recipe 'myface::database'
