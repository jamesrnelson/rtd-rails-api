require 'date'

class GoogleDirectionsService
  def initialize(start_address, end_address,
                departure_time = nil, arrival_time = nil)
    @start_address = configure_address(start_address)
    @end_address = configure_address(end_address)
    @departure_time = configure_time(departure_time)
    @arrival_time = configure_time(arrival_time)
  end

  def configure_address(address)
    address_components = address.delete(',').split(' ')
    address_components.map { |part| part.concat('+') }.join.chop!
  end

  def configure_time(time)
    if time.nil?
      return time
    else
      start_time = DateTime.new(1970, 1, 1)
      time_now = DateTime.now.strftime.split('T').first.split('-')
      today_time = DateTime.new(
        time_now[0].to_i,
        time_now[1].to_i,
        time_now[2].to_i,
        0, 0, 0,
        Rational(-6, 24)
      )
      seconds_since_1970 = ((today_time - start_time) * 24 * 60 * 60).to_i
      split_time_today = time.split(':')
      seconds_since_today = (split_time_today[0].to_i * 3600) + (split_time_today[1].to_i * 60)
      total_seconds = seconds_since_1970 + seconds_since_today
    end
  end

  def trip_information
    raw_info[:routes][0][:legs][0]
  end

  private
    attr_reader :start_address, :end_address, :departure_time, :arrival_time

    def conn
      Faraday.new(url: "https://maps.googleapis.com/maps/api/directions/json")
    end

    def request_trip_info
      conn.get do |req|
        req.params['origin'] = start_address
        req.params['destination'] = end_address
        req.params['mode'] = 'transit'
        req.params['key'] = ENV['google_directions_api_key']
        req.params['departure_time'] = departure_time if !departure_time.nil?
        req.params['arrival_time'] = arrival_time if !arrival_time.nil?
      end
    end

    def response
      @response ||= request_trip_info
    end

    def raw_info
      JSON.parse(response.body, symbolize_names: true)
    end
end
