user_name = node.default['database']['user_name']
user_password = node.default['database']['user_password']
database_name = node.default['database']['database_name']
database_host = node.default['database']['database_host']

ENV['SECRET_KEY']='DUMMY'
base_dir = '/opt/saleor'
application base_dir do
  git base_dir do
    revision 'master'
    repository 'https://github.com/jmikedupont2/saleor'
  end
  python do
    version '3'
    options :system
  end
  virtualenv
  pip_requirements
  django do
    secret_key "F00B4R"
    debug true
    settings_module 'saleor.settings'
    local_settings_path "#{base_dir}/saleor/settings_local.py"
    database "postgres://#{user_name}:#{user_password}@#{database_host}/#{database_name}"
    migrate true
  end
  gunicorn do
    port 9000
  end  
  
end
