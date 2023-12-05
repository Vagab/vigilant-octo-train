module Hostaway
  module Reservations
    module Batch
      class CreateService < BaseService
        def initialize(options = {})
          @options = options
        end

        def call
          Reservation.upsert_all(reservations.map do |params|
            reservation(params)
          end)
        end

        private

        attr_reader :options

        def reservation(params)
          {
            check_in: Time.new(params["arrivalDate"]) + params["checkInTime"].to_i.hours,
            check_out: Time.new(params["departureDate"]) + params["checkOutTime"].to_i.hours,
            price: params["totalPrice"],
            external_created_at: params["reservationDate"],
            external_id: params["id"],
            status: params["status"]
          }
        end

        def reservations
          @reservations ||= FetchService.new(options).call
        end
      end
    end
  end
end
