#
# Cookbook Name:: ruby
# Recipe:: source
#
# Copyright 2013, Thomas Boerger
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

node["ruby"]["source"]["packages"].each do |name|
  package name do
    action :install
  end
end

remote_file ::File.join(Chef::Config[:file_cache_path], node["ruby"]["source"]["file_name"]) do
  source node["ruby"]["source"]["file_download"]
  action :create_if_missing
end

bash "ruby_installer" do
  code <<-EOH
    tar -xzvf #{node["ruby"]["source"]["file_name"]}
    cd #{node["ruby"]["source"]["directory"]}
    make install PREFIX=#{node["ruby"]["source"]["prefix"]}
  EOH

  cwd Chef::Config[:file_cache_path]
  action :run

  not_if do
    ::File.exists? ::File.join(node["ruby"]["source"]["prefix"], "bin", "ruby-install")
  end
end

bash "ruby_compile" do
  code <<-EOH
    #{::File.join(node["ruby"]["source"]["prefix"], "bin", "ruby-install")} --no-reinstall -i #{node["ruby"]["source"]["prefix"]} #{node["ruby"]["source"]["type"]} #{node["ruby"]["source"]["version"]}
  EOH

  cwd Chef::Config[:file_cache_path]
  action :run
end
