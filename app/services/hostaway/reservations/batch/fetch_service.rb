module Hostaway
  module Reservations
    module Batch
      class FetchService < BaseService
        def initialize(options = {})
          @options = options
        end

        def call
          response = fetch_reservations

          response.parsed_response["result"]
        end

        private

        attr_reader :options

        def fetch_reservations
          HTTParty.get(
            "#{BASE_URL}/v1/reservations",
            headers: default_headers,
            query: options
          )
        end
      end
    end
  end
end
