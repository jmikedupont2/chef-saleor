user_name = node.default['database']['user_name']
user_password = node.default['database']['user_password']
database_name = node.default['database']['database_name']
database_host = node.default['database']['database_host']
base_dir = node.default['saleor']['base_dir']

#$ sudo apt-get install 
package 'build-essential'
package 'python3-dev'
package 'python3-pip'
package 'python3-cffi'
package 'libcairo2'
package 'libpango-1.0-0'
package 'libpangocairo-1.0-0'
package 'libgdk-pixbuf2.0-0'
package 'libffi-dev'
package 'shared-mime-info'


ENV['SECRET_KEY']='DUMMY'

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
 # gunicorn do
 #   port 9000
 # end  
  
end

