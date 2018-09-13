class PossibleRouteSerializer < ActiveModel::Serializer
  attributes :departure_time, :arrival_time, :duration, :distance
  has_many :steps
end
