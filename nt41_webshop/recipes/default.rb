#
# Cookbook:: nt41_webshop
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.


include_recipe "nt41_webshop::gce"
include_recipe "nt41_webshop::debian"

include_recipe "nt41_webshop::postgres_server"

include_recipe "nt41_webshop::saleor_python"
include_recipe "nt41_webshop::saleor_node"


#include_recipe "nt41_webshop::test_env"
