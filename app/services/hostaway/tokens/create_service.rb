module Hostaway
  module Tokens
    class CreateService < BaseService
      def call
        response = create_token

        response.parsed_response["access_token"]
      end

      private

      def create_token
        HTTParty.post(
          "#{BASE_URL}/v1/accessTokens",
          body: {
            grant_type: "client_credentials",
            client_id: client_id,
            client_secret: client_secret,
            scope: "general"
          }
        )
      end
    end
  end
end
