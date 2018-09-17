class CreateOtherPossibleRoute < CreateWholeTrip
  attr_reader :itinerary_id, :base_time, :additional_time, :departure_time

  def initialize(itinerary_id, attrs, base_time, additional_time)
    @itinerary_id = itinerary_id
    @start_address = attrs[:start_address]
    @end_address = attrs[:end_address]
    @base_time = base_time
    @additional_time = additional_time
    @departure_time = get_new_time
    @possible_route = create_possible_route
  end

  def create_possible_route
    PossibleRoute.create(
      itinerary_id: itinerary_id,
      duration: itinerary_attrs[:duration][:text],
      distance: itinerary_attrs[:distance][:text],
      departure_time: itinerary_attrs[:departure_time][:text],
      arrival_time: itinerary_attrs[:arrival_time][:text]
    )
  end

  def get_new_time
    split_times = base_time.delete('apm').split(':')
    hours = split_times.first.to_i
    minutes = split_times[1].to_i
    if base_time.include?('pm') && hours < 12
      new_hours = (hours + 12).to_s
    elsif base_time.include?('am') && hours == 12
      new_hours = '0'
    elsif base_time.include?('pm') && hours == 12
      new_hours = '12'
    elsif base_time.include?('am') && hours < 12
      new_hours = hours.to_s
    end
    new_minutes = (minutes + additional_time).to_s
    new_hours + ':' + new_minutes
  end

  private
    attr_reader :start_address, :end_address

    def service
      @service ||= GoogleDirectionsService.new(
        start_address,
        end_address,
        departure_time
      )
    end
end
