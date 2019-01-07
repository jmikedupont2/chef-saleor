include_recipe "nodejs"

base_dir = node.default['saleor']['base_dir']
npm_package 'saleor' do
  path base_dir
  json true
end
