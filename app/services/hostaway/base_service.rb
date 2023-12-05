module Hostaway
  class BaseService < ApplicationService
    BASE_URL = "https://api.hostaway.com".freeze

    private

    def default_headers
      {
        "Authorization" => "Bearer #{token}",
      }
    end

    def token
      @token ||= Rails.application.credentials.dig(:hostaway, :token)
    end

    def client_id
      @client_id ||= Rails.application.credentials.dig(:hostaway, :client_id)
    end

    def client_secret
      @client_secret ||= Rails.application.credentials.dig(:hostaway, :client_secret)
    end
  end
end
