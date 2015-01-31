#
# Cookbook Name:: orezeni
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#


require 'shellwords'

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "rbenv::rbenv_vars"

packages = %w{git}

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

rbenv_ruby "1.9.3-p551" do
  global true
end
