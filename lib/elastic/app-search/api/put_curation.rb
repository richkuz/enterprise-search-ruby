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
        # Curations - Update an existing curation
        #
        # @param engine_name [String]  (*Required*)
        # @param arguments [Hash] endpoint arguments
        # @option arguments [Array] :queries List of affected search queries (*Required*)
        # @option arguments [String] :curation_id  (*Required*)
        # @option arguments [] :promoted_doc_ids List of promoted document IDs
        # @option arguments [] :hidden_doc_ids List of hidden document IDs
        # @option arguments [Hash] :body The request body
        # @option arguments [Hash] :headers optional HTTP headers to send with the request
        #
        # @see https://www.elastic.co/guide/en/app-search/current/curations.html#curations-update
        #
        def put_curation(engine_name, arguments = {})
          raise ArgumentError, "Required parameter 'queries' missing" unless arguments[:queries]
          raise ArgumentError, "Required parameter 'engine_name' missing" unless engine_name
          raise ArgumentError, "Required parameter 'curation_id' missing" unless arguments[:curation_id]

          curation_id = arguments[:curation_id]
          body = arguments.delete(:body) || {}
          headers = arguments.delete(:headers) || {}

          request(
            :put,
            "api/as/v1/engines/#{engine_name}/curations/#{curation_id}/",
            arguments,
            body,
            headers
          )
        end
      end
    end
  end
end
