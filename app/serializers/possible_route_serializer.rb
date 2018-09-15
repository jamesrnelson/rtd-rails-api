class PossibleRouteSerializer < ActiveModel::Serializer
  attributes  :itinerary_id, :start_address, :end_address,
              :favorite, :departure_time, :arrival_time,
              :duration, :distance, :steps

  def favorite
    object.itinerary.favorite
  end

  def itinerary_id
    object.itinerary.id
  end

  def start_address
    object.itinerary.start_address
  end

  def end_address
    object.itinerary.end_address
  end

  def steps
    object.steps.order("id ASC")
  end
end
