class SequentialCalls
  attr_reader :itinerary_id, :itinerary_attrs, :base_time, :repetitions

  def initialize(itinerary_id, itinerary_attrs, base_time, repetitions)
    @itinerary_id = itinerary_id
    @itinerary_attrs = itinerary_attrs
    @base_time = base_time
    @repetitions = repetitions
  end

  def create_possible_routes
    additional_time = 15
    repetitions.times do
      CreateOtherPossibleRoute.new(itinerary_id, itinerary_attrs, base_time, additional_time).create_steps
      additional_time += 15
    end
  end
end
