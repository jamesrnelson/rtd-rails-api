class GoogleDirectionsService
  def initialize(start_address, end_address, departure_time = nil)
    @start_address = start_address
    @end_address = end_address
    @departure_time = departure_time
  end

  def trip_information
    raw_info[:routes][0][:legs][0]
  end

  private
    attr_reader :start_address, :end_address, :departure_time

    def conn
      Faraday.new(url: "https://maps.googleapis.com/maps/api/directions/json")
    end

    def request_trip_info
      conn.get do |req|
        req.params['origin'] = start_address
        req.params['destination'] = end_address
        req.params['mode'] = 'transit'
        req.params['key'] = ENV['google_directions_api_key']
        if !departure_time.nil?
          req.params['departure_time'] = departure_time
        end
      end
    end

    def response
      @response ||= request_trip_info
    end

    def raw_info
      JSON.parse(response.body, symbolize_names: true)
    end
end
