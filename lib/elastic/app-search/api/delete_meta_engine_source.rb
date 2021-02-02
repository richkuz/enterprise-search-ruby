# frozen_string_literal: true

# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Elastic
  module EnterpriseSearch
    module AppSearch
      module Actions
        # Engine - Delete a source engine from a meta engine
        #
        # @param engine_name [String]  (*Required*)
        # @param arguments [Hash] endpoint arguments
        # @option source_engines [Array] List of engine names (*Required*)
        #
        # @param headers [Hash] optional HTTP headers to send with the request
        #
        # @see https://www.elastic.co/guide/en/app-search/current/meta-engines.html#meta-engines-remove-source-engines
        #
        def delete_meta_engine_source(engine_name, arguments = {}, headers = {})
          raise ArgumentError, "Required parameter 'engine_name' missing" unless engine_name
          raise ArgumentError, "Required parameter 'source_engines' missing" unless arguments[:source_engines]

          source_engines = arguments.delete(:source_engines) || {}

          request(
            :delete,
            "api/as/v1/engines/#{engine_name}/source_engines/",
            arguments,
            source_engines,
            headers
          )
        end
      end
    end
  end
end
