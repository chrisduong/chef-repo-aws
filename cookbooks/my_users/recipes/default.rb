#
# Cookbook Name:: my_users
# Recipe:: default
#
# Copyright 2014, chrisD
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


users_manage "rebels" do
  group_id 1138
  action [ :remove, :create ]
end



%w( scoundrels sidekicks siths empire sysadmin ).each do |group|
  users_manage group  do
    action [ :remove, :create ]
  end
end

#Making sure root can log in with its ssh key
user "root" do
  group "sysadmin"
end

node.default['authorization']['sudo']['passwordless'] = true
include_recipe "sudo"