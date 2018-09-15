require 'rails_helper'

describe "GET /api/v1/users/:uid/favorites" do
  it "can get a users favorite itineraries" do
    user = create(:user, uid: 'abc123')

    fav_itinerary_1 = user.itineraries.create(start_address: "100 W. 14th Pkwy Denver CO 80204", end_address: "1331 17th St Denver CO", favorite: true, title: 'commute')
    fav_itinerary_2 = user.itineraries.create(start_address: "2935 W. 7th Ave Denver CO 80204", end_address: "1331 17th St Denver CO", favorite: true, title: 'concert')
    possible_route_1 = create(:possible_route, itinerary_id: fav_itinerary_1.id)
    possible_route_2 = create(:possible_route, itinerary_id: fav_itinerary_2.id)
    
    get "/api/v1/users/#{user.uid}/favorites"
    
    expect(response).to be_successful
    favorites = JSON.parse(response.body, symbolize_names: true)
    expect(favorites[0][:title]).to eq('commute')
    expect(favorites[1][:title]).to eq('concert')
  end
end