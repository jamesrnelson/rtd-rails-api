class CreateWholeTrip
  attr_reader :user_id, :itinerary, :possible_route
  def initialize(user_id, attrs)
    # binding.pry
    @user_id = user_id
    @start_address = attrs[:start_address]
    @end_address = attrs[:end_address]
    @departure_time = attrs[:departure_time]
    @arrival_time = attrs[:arrival_time]
    @itinerary = create_itinerary
    @possible_route = create_possible_route
  end

  def itinerary_attrs
    service.trip_information
  end

  def create_itinerary
    Itinerary.create(
      user_id: user_id,
      start_address: itinerary_attrs[:start_address],
      end_address: itinerary_attrs[:end_address],
    )
  end

  def create_possible_route
    PossibleRoute.create(
      itinerary_id: itinerary.id,
      duration: itinerary_attrs[:duration][:text],
      distance: itinerary_attrs[:distance][:text],
      departure_time: itinerary_attrs[:departure_time][:text],
      arrival_time: itinerary_attrs[:arrival_time][:text]
    )
  end

  def create_steps
    itinerary_attrs[:steps].each do |step|
      if step[:travel_mode] == 'WALKING'
        Step.create(
          possible_route_id:  possible_route.id,
          distance:           step[:distance][:text],
          duration:           step[:duration][:text],
          instructions:       step[:html_instructions],
          travel_mode:        'Walking'
        )
      else
        Step.create(
          possible_route_id: possible_route.id,
          distance:       step[:distance][:text],
          duration:       step[:duration][:text],
          instructions:   step[:html_instructions],
          headsign:       step[:transit_details][:headsign],
          arrival_time:   step[:transit_details][:arrival_time][:text],
          departure_time: step[:transit_details][:departure_time][:text],
          arrival_stop:   step[:transit_details][:arrival_stop][:name],
          departure_stop: step[:transit_details][:departure_stop][:name],
          name:           step[:transit_details][:line][:name],
          short_name:     step[:transit_details][:line][:short_name],
          color:          step[:transit_details][:line][:color],
          vehicle_type:   step[:transit_details][:line][:vehicle][:name],
          credit_name:    step[:transit_details][:line][:agencies][0][:name],
          credit_url:     step[:transit_details][:line][:agencies][0][:url],
          num_stops:      step[:transit_details][:num_stops],
          travel_mode:    step[:travel_mode]
        )
      end
    end
  end

  private
    attr_reader :start_address, :end_address, :departure_time, :arrival_time

    def service
      @service ||= GoogleDirectionsService.new(
        start_address,
        end_address,
        departure_time,
        arrival_time
      )
    end
end
