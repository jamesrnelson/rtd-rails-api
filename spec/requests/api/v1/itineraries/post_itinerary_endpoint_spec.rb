require 'rails_helper'

describe 'POST /api/v1/users/:id/itineraries' do
  it 'accepts json of start_address, end_address, and departure_time', vcr: true do
    user = create(:user)

    expected = [
    {
        "itinerary_id": 1,
        "start_address": "100 W 14th Ave Pkwy, Denver, CO 80203, USA",
        "end_address": "Denver International Airport (DEN), 8500 Peña Blvd, Denver, CO 80249, USA",
        "favorite": false,
        "departure_time": "5:02pm",
        "arrival_time": "6:07pm",
        "duration": "1 hour 4 mins",
        "distance": "25.1 mi",
        "steps": [
            {
                "id": 1,
                "possible_route_id": 1,
                "headsign": nil,
                "arrival_time": nil,
                "departure_time": nil,
                "arrival_stop": nil,
                "departure_stop": nil,
                "name": nil,
                "short_name": nil,
                "instructions": "Walk to Colfax Ave & Broadway",
                "distance": "0.2 mi",
                "duration": "5 mins",
                "color": nil,
                "num_stops": nil,
                "vehicle_type": nil,
                "credit_name": nil,
                "credit_url": nil,
                "travel_mode": "Walking"
            },
            {
                "id": 2,
                "possible_route_id": 1,
                "headsign": "Union Station Downtown",
                "arrival_time": "5:20pm",
                "departure_time": "5:08pm",
                "arrival_stop": "Union Station",
                "departure_stop": "Colfax Ave & Broadway",
                "name": "East Colfax Avenue",
                "short_name": "15",
                "instructions": "Bus towards Union Station Downtown",
                "distance": "1.5 mi",
                "duration": "12 mins",
                "color": "#0277bd",
                "num_stops": 8,
                "vehicle_type": "Bus",
                "credit_name": "Regional Transportation District",
                "credit_url": "http://rtd-denver.com/",
                "travel_mode": "TRANSIT"
            },
            {
                "id": 3,
                "possible_route_id": 1,
                "headsign": nil,
                "arrival_time": nil,
                "departure_time": nil,
                "arrival_stop": nil,
                "departure_stop": nil,
                "name": nil,
                "short_name": nil,
                "instructions": "Walk to Union Station",
                "distance": "0.1 mi",
                "duration": "3 mins",
                "color": nil,
                "num_stops": nil,
                "vehicle_type": nil,
                "credit_name": nil,
                "credit_url": nil,
                "travel_mode": "Walking"
            },
            {
                "id": 4,
                "possible_route_id": 1,
                "headsign": "Denver Airport",
                "arrival_time": "6:07pm",
                "departure_time": "5:30pm",
                "arrival_stop": "Denver Airport Station",
                "departure_stop": "Union Station",
                "name": "Union Station to Denver Airport Station",
                "short_name": "A",
                "instructions": "Train towards Denver Airport",
                "distance": "23.3 mi",
                "duration": "37 mins",
                "color": "#4fc3f7",
                "num_stops": 7,
                "vehicle_type": "Train",
                "credit_name": "Regional Transportation District",
                "credit_url": "http://rtd-denver.com/",
                "travel_mode": "TRANSIT"
            }
        ]
    }
]

    post "/api/v1/users/#{user.id}/itineraries", params: { start_address: "100 W 14th Ave Pkwy Denver CO 80204", end_address: "Denver International Airport", departure_time: '17:00' }

    expect(response).to be_successful

    new_itinerary = JSON.parse(response.body, symbolize_names: true)
    expect(new_itinerary[0][:steps].length).to eq(4)
    expect(new_itinerary).to eq(expected)
  end

  it 'also accepts json including arrival time', vcr: true do
    user = create(:user)


    post "/api/v1/users/#{user.id}/itineraries", params: { start_address: "100 W 14th Ave Pkwy Denver CO 80204", end_address: "1331 17th St Denver CO", arrival_time: '17:00'}

    expect(response).to be_successful

    new_itinerary = JSON.parse(response.body, symbolize_names: true)
    expect(new_itinerary[0][:steps].length).to eq(3)
  end
end
