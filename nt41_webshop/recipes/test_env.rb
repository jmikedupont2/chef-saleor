application_virtualenv("/opt/saleor") do
  provider PoisePython::Resources::PythonVirtualenv::Provider
  action [:create]
  #default_guard_interpreter :default
  #subresources [application_pip_requirements[/opt/saleor], application_django[/opt/saleor], python_runtime_pip[/opt/saleor], python_package[setuptools], python_package[wheel]]
  #declared_type :application_virtualenv
  #parent application[/opt/saleor]
  #parent_python application_python[3]
  path "/opt/saleor/.virtualenv"
  get_pip_url "https://bootstrap.pypa.io/get-pip.py"
  pip_version true
  setuptools_version true
  wheel_version true
end
