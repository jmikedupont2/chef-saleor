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

# postgresql_access 'postgresql host superuser' do
#   access_type       'host'
#   access_db         'all'
#   access_user       'postgres'
#   access_addr       '127.0.0.1/32'
#   access_method     'md5'
#   notifies :reload, 'service[postgresql]'
# end

postgresql_user user_name do
  superuser true
  password user_password
  sensitive false
end

postgresql_access 'a local superuser' do
  access_type 'host'
  access_db 'all'
  access_user user_name
  access_method 'md5'
  access_addr '127.0.0.1/32'
  notifies :reload, 'service[postgresql]'
end

postgresql_access 'a local superuser' do
  access_type 'host'
  access_db 'all'
  access_user user_name
  access_method 'md5'
  access_addr '::1/128'
  notifies :reload, 'service[postgresql]'
end

