require 'grit'

organization_base_name = "chrisd8313"
user = "chrisduong"
node_name    user   
repository = Grit::Repo.new(Dir.pwd)
current_branch = Grit::Head.current(repository).name
organization = organization_base_name
organization << "-#{current_branch}" unless current_branch == 'master'
validation_client_name  "#{ENV['ORGNAME']}-validator"
validation_key          "#{ENV['HOME']}/.chef/#{ENV['ORGNAME']}-validator.pem"
client_key  "#{ENV['HOME']}/.chef/#{user}-opscode.pem"
chef_server_url  "https://api.opscode.com/organizations/#{organization}"
cookbook_path           "#{ENV['HOME']}/repo/testing/chef-repo/cookbooks"