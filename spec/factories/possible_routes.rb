FactoryBot.define do
  factory :possible_route do
    departure_time { "11:35am" }
    arrival_time { "12:45pm" }
    duration { "1 hour 10 mins" }
    distance { "10 mi" }
    itinerary
  end
end
