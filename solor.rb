current_dir = File.expand_path(File.dirname(__FILE__))
file_cache_path "#{current_dir}"
cookbook_path "#{current_dir}/cookbooks"
role_path "#{current_dir}/roles"
data_bag_apth "#{current_dir}/data_bags"