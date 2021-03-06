#
# Cookbook Name:: ruby
# Attributes:: source
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
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

default["ruby"]["source"]["packages"] = value_for_platform_family(
  "debian" => %w(
    libxml2-dev
    libxslt-dev
  ),
  "suse" => %w(
    libxml2-devel
    libxslt-devel
  )
)

default["ruby"]["source"]["gems"] = value_for_platform_family(
  "debian" => %w(

  ),
  "suse" => %w(

  )
)

default["ruby"]["source"]["file_name"] = "ruby-install-0.5.0.tar.gz"
default["ruby"]["source"]["file_download"] = "https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz"
default["ruby"]["source"]["directory"] = "ruby-install-0.5.0"
default["ruby"]["source"]["prefix"] = "/usr/local"
default["ruby"]["source"]["type"] = "ruby"
default["ruby"]["source"]["version"] = "stable"
