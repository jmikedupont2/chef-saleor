# Cookbook Name:: postgresql_setup
# Recipe:: default
#
# Copyright 2018, NT41 Solutions
#
# All rights reserved - Do Not Redistribute
#
user_name = node.default['database']['user_name']
user_password = node.default['database']['user_password']
database_name = node.default['database']['database_name']


#node.default['postgresql']['enable_pgdg_apt'] = true
#node.default['postgresql']['config']['listen_addresses'] = 'localhost'
#node.default['postgresql']['password']['postgres'] = user_password

postgresql_repository 'install'

postgresql_server_install 'package' do
	action [:install, :create ]
      	initdb_locale 'en_US.UTF-8'
end

# Using this to generate a service resource to control
find_resource(:service, 'postgresql') do
  extend PostgresqlCookbook::Helpers
  service_name lazy { platform_service_name }
  supports restart: true, status: true, reload: true
  action [:enable, :start]
end

postgresql_server_conf 'PostgreSQL Config' do
  notifies :reload, 'service[postgresql]'
end

postgresql_database database_name do
  locale 'en_US.UTF-8'
end


# include_recipe 'postgresql'
# # connection info

# postgresql_connection_info = {
#   :host     => '127.0.0.1',
#   :port     => node['postgresql']['config']['port'],
#   :username => 'postgres',
#   :password => node['postgresql']['password']['postgres']
# }

# postgresql_database_user user_name do
#   connection postgresql_connection_info
#   password user_password
#   superuser true
#   login true
#   action :create
# end


# # create a postgresql database
# postgresql_database user_name do
#   connection postgresql_connection_info
#   encoding "UTF-8"
#   action :create
# end

# postgresql_database_user user_name do
#   connection postgresql_connection_info
#   database_name database_name
#   privileges [:all]
#   action :grant
# end

# change_notify = node['postgresql']['server']['config_change_notify']

# template "#{node['postgresql']['dir']}/pg_hba.conf" do
#   source "pg_hba.conf.erb"
#   owner "postgres"
#   group "postgres"
#   mode 0600
#   notifies change_notify, 'service[postgresql]', :immediately
# end
