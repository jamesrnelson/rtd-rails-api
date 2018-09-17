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
    expect(favorite_itineraries[0][:title]).to eq('commute')
    expect(favorite_itineraries[1][:title]).to eq('concert')
    expect(favorite_itineraries[0][:possible_routes][0][:steps].length).to eq(2)
    expect(favorite_itineraries[1][:possible_routes][0][:steps].length).to eq(2)
  end
end
describe "GET /api/v1/users/:uid/favorites/:favorite_id" do
  it "can get a single favorite itinerary" do
    user = create(:user, uid: 'abc123')

    fav_itinerary_1 = user.itineraries.create(start_address: "100 W. 14th Pkwy Denver CO 80204", end_address: "1331 17th St Denver CO", favorite: true, title: 'commute')
    fav_itinerary_2 = user.itineraries.create(start_address: "2935 W. 7th Ave Denver CO 80204", end_address: "1331 17th St Denver CO", favorite: true, title: 'concert')
    possible_route_1 = create(:possible_route, itinerary_id: fav_itinerary_1.id)
    possible_route_2 = create(:possible_route, itinerary_id: fav_itinerary_2.id)

    get "/api/v1/users/#{user.uid}/favorites/#{fav_itinerary_2.id}"

    expect(response).to be_successful
    favorite = JSON.parse(response.body, symbolize_names: true)
    expect(favorite[:id]).to eq(fav_itinerary_2.id)
    expect(favorite[:title]).to eq(fav_itinerary_2.title)
  end
end