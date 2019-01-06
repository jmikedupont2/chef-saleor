
#include_recipe 'poise-python'
user_name = node.default['database']['user_name']
user_password = node.default['database']['user_password']
database_name = node.default['database']['database_name']
database_host = node.default['database']['database_host']

application '/opt/saleor' do
  git '/opt/saleor' do
    revision 'master'
    repository 'https://github.com/mirumee/saleor'
  end
  #  python 'pypy3-5.7'
  python do
    version '3'
    options :system
  end
  #virtualenv
  pip_requirements
  django do
    database "postgres://#{user_name}@#{database_host}/#{database_name}"
    migrate true
  end
  #gunicorn do
  #  port 9000
  #end

  #poise_service_options '/opt/saleor' do
  #  restart_delay 30
  #end
end
