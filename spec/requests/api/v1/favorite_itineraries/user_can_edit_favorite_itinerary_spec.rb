require 'rails_helper'

describe 'PUT /api/v1/users/:id/favorite_itinerary' do
  it "can edit a user's favorite itinerary" do
    user = create(:user, uid: 'abc123')


    fav_itinerary_1 = user.itineraries.create(start_address: "100 W. 14th Pkwy Denver CO 80204", end_address: "1331 17th St Denver CO", favorite: true, title: 'commute')
    fav_itinerary_2 = user.itineraries.create(start_address: "2935 W. 7th Ave Denver CO 80204", end_address: "1331 17th St Denver CO", favorite: true, title: 'concert')
    possible_route_1 = create(:possible_route, itinerary_id: fav_itinerary_1.id)
    possible_route_2 = create(:possible_route, itinerary_id: fav_itinerary_2.id)
    step_1 = create(:step, possible_route_id: possible_route_2.id)
    step_2 = create(:step, possible_route_id: possible_route_2.id)

    put "/api/v1/users/#{user.uid}/favorites/#{fav_itinerary_2.id}", params: {title: '7th Circle'}
    edited = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(edited[:start_address]).to eq(fav_itinerary_2.start_address)
    expect(edited[:end_address]).to eq(fav_itinerary_2.end_address)
  end
end
