# encoding: utf-8
# vim: ft=ruby expandtab shiftwidth=2 tabstop=2

#
# Cookbook Name:: orezeni
# Attributes:: default
#
# Author:: Takayuki Miyauchi
# License: MIT
#

default[:orezeni][:repository] = 'https://github.com/orezeni/orezeni.github.com.git'
default[:orezeni][:htdocs]     = '/var/www/orezeni'
default[:orezeni][:packages]   = %w{git nginx}
