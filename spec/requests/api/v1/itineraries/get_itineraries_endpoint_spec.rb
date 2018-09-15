require 'rails_helper'

describe 'GET /api/v1/users/:id/itineraries' do
  it 'should return all itineraries that a user has searched for' do
    user = create!(:user)
    itinerary1 = create(:itinerary, user_id: user.uid, uid: user.uid)
    itinerary2 = create(:itinerary, user_id: user.uid, uid: user.uid)
    possible_route1 = create(:possible_route, itinerary_id: itinerary1.id)
    possible_route2 = create(:possible_route, itinerary_id: itinerary2.id)
    step1 = create(:step, possible_route_id: possible_route1.id)
    step2 = create(:step, possible_route_id: possible_route1.id)
    step3 = create(:step, possible_route_id: possible_route2.id)
    step4 = create(:step, possible_route_id: possible_route2.id)

    get "/api/v1/users/#{user.id}/itineraries"

    expect(response).to be_successful
    itineraries = JSON.parse(response.body, symbolize_names: true)
    expect(itineraries.length).to eq(2)
    expect(itineraries[0][:steps].length).to eq(2)
    expect(itineraries[1][:steps].length).to eq(2)
  end
end
