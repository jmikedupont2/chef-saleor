# Cookbook Name:: postgresql_setup
# Recipe:: default
#
# Copyright 2018, NT41 Solutions
#
# All rights reserved - Do Not Redistribute
#

include_recipe "postgresql::server"



user_name = 'webshop'
user_password = 'hyp(OgTar1'
database_name = user_name

# connection info

postgresql_connection_info = {
  :host     => '127.0.0.1',
  :port     => node['postgresql']['config']['port'],
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

postgresql_database_user user_name do
  connection postgresql_connection_info
  password user_password
  superuser true
  login true
  action :create
end


# create a postgresql database
postgresql_database user_name do
  connection postgresql_connection_info
  encoding "UTF-8"
  action :create
end

postgresql_database_user user_name do
  connection postgresql_connection_info
  database_name database_name
  privileges [:all]
  action :grant
end

change_notify = node['postgresql']['server']['config_change_notify']

# template "#{node['postgresql']['dir']}/pg_hba.conf" do
#   source "pg_hba.conf.erb"
#   owner "postgres"
#   group "postgres"
#   mode 0600
#   notifies change_notify, 'service[postgresql]', :immediately
# end
