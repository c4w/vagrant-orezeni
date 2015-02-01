# encoding: utf-8
# vim: ft=ruby expandtab shiftwidth=2 tabstop=2

#
# Cookbook Name:: orezeni
# Recipe:: default
#
# Copyright (C) 2015 Takayuki Miyauchi
#
# All rights reserved - Do Not Redistribute
#


require 'shellwords'

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "rbenv::rbenv_vars"

execute "locale-gen ja_JP.UTF-8"

node[:orezeni][:packages].each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

rbenv_ruby "1.9.3-p551" do
  global true
end

rbenv_gem "bundle" do
  action :install
end

directory node[:orezeni][:htdocs] do
  recursive true
  user  "vagrant"
  group "vagrant"
end

git node[:orezeni][:htdocs] do
  repository node[:orezeni][:repository]
  reference  "master"
  user  "vagrant"
  group "vagrant"
  action :sync
end

execute "bundle install --path vendor/bundler" do
  user  "vagrant"
  group "vagrant"
  cwd   node[:orezeni][:htdocs]
end

template File.join(node[:orezeni][:htdocs], 'Rakefile') do
  source "rakefile.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  variables(
    :htdocs => File.join(node[:orezeni][:htdocs], '_site')
  )
end

execute "bundle exec rake build" do
  user  "vagrant"
  group "vagrant"
  cwd   node[:orezeni][:htdocs]
end

template "/etc/nginx/sites-available/default" do
  source "nginx.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  variables(
    :htdocs => File.join(node[:orezeni][:htdocs], '_site')
  )
end

service "nginx" do
  action [ :enable, :start, :restart ]
end
