class PossibleRouteSerializer < ActiveModel::Serializer
  attributes :itinerary_id, :start_address, :end_address, :favorite, :departure_time, :arrival_time, :duration, :distance
  has_many :steps

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
end
