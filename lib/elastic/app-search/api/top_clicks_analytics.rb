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
        # Analytics - Returns the number of clicks received by a document in descending order
        #
        # @param engine_name [String]  (*Required*)
        # @param arguments [Hash] endpoint arguments
        # @option arguments [String] :query Filter clicks over a search query
        # @option arguments [String] :current_page The page to fetch. Defaults to 1
        # @option arguments [String] :page_size The number of results per page
        # @option arguments [Array] :filters Analytics filters
        # @option arguments [Hash] :body The request body
        # @option arguments [Hash] :headers optional HTTP headers to send with the request
        #
        # @see https://www.elastic.co/guide/en/app-search/current/clicks.html
        #
        def top_clicks_analytics(engine_name, arguments = {})
          raise ArgumentError, "Required parameter 'engine_name' missing" unless engine_name

          body = arguments.delete(:body) || {}
          headers = arguments.delete(:headers) || {}

          request(
            :get,
            "api/as/v1/engines/#{engine_name}/analytics/clicks/",
            arguments,
            body,
            headers
          )
        end
      end
    end
  end
end
