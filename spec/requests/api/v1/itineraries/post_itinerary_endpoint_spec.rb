require 'rails_helper'

describe 'POST /api/v1/users/:id/itineraries' do
  it 'accepts json of start_address, end_address, and departure_time', vcr: true do
    user = create(:user, uid: 'abc123')

    post "/api/v1/users/#{user.uid}/itineraries", params: { start_address: "100 W 14th Ave Pkwy Denver CO 80204", end_address: "Denver International Airport", departure_time: '17:00' }

    expect(response).to be_successful

    new_itinerary = JSON.parse(response.body, symbolize_names: true)
    expect(new_itinerary[0][:steps].length).to eq(4)
    expect(new_itinerary[0][:steps].first[:id]).to eq(1)
    expect(new_itinerary[0][:steps].last[:id]).to eq(4)
  end

  it 'also accepts json including arrival time', vcr: true do
    user = create(:user, uid: 'abc123')

    post "/api/v1/users/#{user.uid}/itineraries", params: { start_address: "100 W 14th Ave Pkwy Denver CO 80204", end_address: "1331 17th St Denver CO", arrival_time: '17:00'}

    expect(response).to be_successful

    new_itinerary = JSON.parse(response.body, symbolize_names: true)
    expect(new_itinerary[0][:steps].length).to eq(3)
  end

  it 'returns multiple possible routes for one itinerary', vcr: true do
    user = create(:user, uid: 'abc123')

    post "/api/v1/users/#{user.uid}/itineraries", params: { start_address: "661 Logan St, Denver, CO 80203", end_address: "750 North Colorado Boulevard, Denver, CO 80206", departure_time: '17:00'}

    expect(response).to be_successful

    new_itineraries = JSON.parse(response.body, symbolize_names:true)
    expect(new_itineraries.length).to eq(4)
    expect(new_itineraries[0][:departure_time]).to eq("5:06pm")
    expect(new_itineraries[2][:departure_time]).to eq("5:36pm")
    expect(new_itineraries[3][:departure_time]).to eq("5:51pm")
  end
end
