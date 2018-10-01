require 'rails_helper'

describe 'GET /api/v1/users/:id/itineraries' do
  it 'should return all itineraries that a user has searched for' do
    user = create(:user, uid: 'abc123')
    itinerary1 = create(:itinerary, user_id: user.id)
    itinerary2 = create(:itinerary, user_id: user.id)
    itinerary3 = create(:itinerary, user_id: user.id)
    itinerary4 = create(:itinerary, user_id: user.id)
    itinerary5 = create(:itinerary, user_id: user.id)
    itinerary6 = create(:itinerary, user_id: user.id)
    possible_route1 = create(:possible_route, itinerary_id: itinerary1.id)
    possible_route2 = create(:possible_route, itinerary_id: itinerary2.id)
    possible_route3 = create(:possible_route, itinerary_id: itinerary3.id)
    step1 = create(:step, possible_route_id: possible_route1.id)
    step2 = create(:step, possible_route_id: possible_route1.id)
    step3 = create(:step, possible_route_id: possible_route2.id)
    step4 = create(:step, possible_route_id: possible_route2.id)
    step5 = create(:step, possible_route_id: possible_route3.id)

    get "/api/v1/users/#{user.uid}/itineraries?amount=#{5}"

    expect(response).to be_successful
    itineraries = JSON.parse(response.body, symbolize_names: true)
    
    expect(itineraries.length).to eq(5)
    expect(itineraries[0][:favorite]).to eq(false)
    expect(itineraries[1][:favorite]).to eq(false)
    expect(itineraries[2][:favorite]).to eq(false)
    expect(itineraries[3][:favorite]).to eq(false)
    expect(itineraries[4][:favorite]).to eq(false)
  end
end
