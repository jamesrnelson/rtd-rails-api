class ItinerarySerializer < ActiveModel::Serializer
  attributes :id, :start_address, :end_address, :favorite
end
