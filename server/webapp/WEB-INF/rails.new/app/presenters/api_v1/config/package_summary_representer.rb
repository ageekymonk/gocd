##########################################################################
# Copyright 2015 ThoughtWorks, Inc.
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
##########################################################################

module ApiV1
  module Config
    class PackageSummaryRepresenter < ApiV1::BaseRepresenter
      alias_method :package, :represented

      link :self do |opts|
        opts[:url_builder].apiv1_admin_package_url(package_id: package.id)
      end

      link :doc do |opts|
        'https://api.gocd.io/#packages'
      end

      link :find do |opts|
        opts[:url_builder].apiv1_admin_package_url(package_id: '__package_id__').gsub(/__package_id__/, ':package_id')
      end 

      property :name
      property :id
    end
  end

end
