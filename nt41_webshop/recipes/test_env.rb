include_recipe "nt41_webshop::saleor_node"
# application_gunicorn("/opt/saleor") do
#  # provider Chef::Provider::Service::Systemd
#   action [:enable]
# #  default_guard_interpreter :default
# #  declared_type :application_gunicorn
# #  cookbook_name "nt41_webshop"
# #  recipe_name "saleor_python"
#   #parent application[/opt/saleor]
#   bind "0.0.0.0:9000"
#   #parent_python application_python[/opt/saleor]
#   path "/opt/saleor"
#   service_name "saleor"
# end

# service("saleor") do
#   provider Chef::Provider::Service::Debian
# #  default_guard_interpreter :default
#   service_name "saleor"
#   pattern "saleor"
#   #        Option action must be equal to one of: :nothing, :enable, :disable, :start, :stop, :restart, :reload, :mask, :unmask!  You passed :create.
#   action [ :enable ]
# #  declared_type :service
# end

# application_virtualenv("/opt/saleor") do
#   provider PoisePython::Resources::PythonVirtualenv::Provider
#   action [:create]
#   #default_guard_interpreter :default
#   #subresources [application_pip_requirements[/opt/saleor], application_django[/opt/saleor], python_runtime_pip[/opt/saleor], python_package[setuptools], python_package[wheel]]
#   #declared_type :application_virtualenv
#   #parent application[/opt/saleor]
#   #parent_python application_python[3]
#   path "/opt/saleor/.virtualenv"
#   get_pip_url "https://bootstrap.pypa.io/get-pip.py"
#   pip_version true
#   setuptools_version true
#   wheel_version true
# end
