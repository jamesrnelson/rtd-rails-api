require 'rails_helper'

describe 'POST /api/v1/users/:id/itineraries' do
  it 'accepts json of start_address, end_address, and departure_time', vcr: true do
    user = User.create

    expected = {
      'id': 1,
      'arrival_time': '11:47am',
      'departure_time': '11:30am',
      'distance': '1.5 mi',
      'duration': '17 mins',
      'start_address': '100 W 14th Ave Pkwy, Denver, CO 80203, USA',
      'end_address': '1331 17th St, Denver, CO 80202, USA',
      'steps': [
        {
          'instructions': 'Walk to Colfax Ave & Broadway',
          'distance': '0.2 mi',
          'duration': '5 mins'
        },
        {
          'headsign': 'Union Station Downtown',
          'name': 'East Colfax Avenue',
          'short_name': '15',
          'distance': '1.1 mi',
          'duration': '9 mins',
          'instructions': 'Bus towards Union Station Downtown',
          'departure_stop': 'Colfax Ave & Broadway',
          'departure_time': '11:36am',
          'arrival_stop': '18th St & Larimer St',
          'arrival_time': '11:44am',
          'color': '#0277bd',
          'num_stops': 6
        },
        {
          'instructions': 'Walk to 1331 17th St, Denver, CO 80202, USA',
          'distance': '0.1 mi',
          'duration': '2 mins'
        }
      ]
    }

    post "/api/v1/users/#{user.id}/itineraries", params: { start_address: "100 W 14th Ave Pkwy Denver CO 80204", end_address: "1331 17th St Denver CO", departure_time: '12:00'}

    expect(response).to be_success

    new_itinerary = JSON.parse(response.body, symbolize_names: true)
    expect(new_itinerary).to eq(expected)
  end

  xit 'also accepts json including arrival time' do

  end
end
