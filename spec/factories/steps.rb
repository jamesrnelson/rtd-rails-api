FactoryBot.define do
  factory :step do
    distance { "1 mi" }
    duration { "10 mins" }
    instructions { "Take the bus" }
    headsign { "Union Station" }
    arrival_time { '12:00pm' }
    departure_time { '11:50am' }
    arrival_stop { '18th St & Market St' }
    departure_stop { 'Lowry Blvd & Rampart Way' }
    name { 'Union Station' }
    short_name { '6' }
    color { '#FFFFFF' }
    credit_name { 'Regional Transportation District' }
    credit_url { 'http://rtd-denver.com' }
    vehicle_type { 'Bus' }
    num_stops { '32' }
    travel_mode { 'TRANSIT' }
    possible_route
  end
end
