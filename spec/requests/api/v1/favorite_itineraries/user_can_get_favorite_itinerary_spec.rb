require 'rails_helper'

describe "GET /api/v1/users/:uid/favorites" do
  it "can get a users favorite itineraries", vcr: true do
    user = create(:user, uid: 'abc123')

    fav_itinerary_1 = user.itineraries.create(start_address: "100 W. 14th Pkwy Denver CO 80204", end_address: "1331 17th St Denver CO", favorite: true, title: 'commute')
    fav_itinerary_2 = user.itineraries.create(start_address: "2935 W. 7th Ave Denver CO 80204", end_address: "1331 17th St Denver CO", favorite: true, title: 'concert')
    possible_route_1 = create(:possible_route, itinerary_id: fav_itinerary_1.id)
    possible_route_2 = create(:possible_route, itinerary_id: fav_itinerary_2.id)
    step_1 = create(:step, possible_route_id: possible_route_1.id)
    step_2 = create(:step, possible_route_id: possible_route_1.id)
    step_3 = create(:step, possible_route_id: possible_route_2.id)
    step_4 = create(:step, possible_route_id: possible_route_2.id)

    get "/api/v1/users/#{user.uid}/favorites"

    expect(response).to be_successful
    favorite_itineraries = JSON.parse(response.body, symbolize_names: true)
    expect(favorite_itineraries[0][:start_address]).to eq(fav_itinerary_1.start_address)
    expect(favorite_itineraries[0][:end_address]).to eq(fav_itinerary_1.end_address)
    expect(favorite_itineraries[1][:start_address]).to eq(fav_itinerary_2.start_address)
    expect(favorite_itineraries[1][:end_address]).to eq(fav_itinerary_2.end_address)
  end
end

describe "GET /api/v1/users/:uid/favorites/:favorite_id" do
  it "can get a single favorite itinerary", vcr: true do
    user = create(:user, uid: 'abc123')

    fav_itinerary_1 = user.itineraries.create(start_address: "100 W. 14th Pkwy Denver CO 80204", end_address: "1331 17th St Denver CO", favorite: true, title: 'commute')
    fav_itinerary_2 = user.itineraries.create(start_address: "2935 W. 7th Ave Denver CO 80204", end_address: "1331 17th St Denver CO", favorite: true, title: 'concert')
    possible_route_1 = create(:possible_route, itinerary_id: fav_itinerary_1.id)
    possible_route_2 = create(:possible_route, itinerary_id: fav_itinerary_2.id)
    step_1 = create(:step, possible_route_id: possible_route_2.id)
    step_2 = create(:step, possible_route_id: possible_route_2.id)

    get "/api/v1/users/#{user.uid}/favorites/#{fav_itinerary_2.id}"

    expect(response).to be_successful
    possible_routes = JSON.parse(response.body, symbolize_names: true)
    expect(possible_routes.length).to eq(4)
    expect(possible_routes[0][:start_address]).to eq(fav_itinerary_2.start_address)
    expect(possible_routes[0][:end_address]).to eq(fav_itinerary_2.end_address)
  end
end
