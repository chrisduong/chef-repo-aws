#
# Cookbook Name:: wp_setup
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

wp_setup "extracting wordpress" do
  wp_path node['wordpress']['path']
  wp_url  node['wordpress']['url']
  action :extract
end

wp_setup "deleting the installation file" do
  wp_path node['wordpress']['path']
  action :remove
end