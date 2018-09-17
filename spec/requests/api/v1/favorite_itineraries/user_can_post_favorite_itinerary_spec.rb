require 'rails_helper'

describe 'POST /api/v1/users/:id/favorite_itineraries' do
  it 'can post a user\'s favorite itinerary' do
    user = create(:user, uid: 'abc123')
  
    itinerary = user.itineraries.create( start_address: "100 W. 14th Pkwy Denver CO 80204", end_address: "1331 17th St Denver CO")
    possible_route = create(:possible_route, itinerary_id: itinerary.id)
    post "/api/v1/users/#{user.uid}/itineraries/#{itinerary.id}", params: { title: "Title" }

    expect(response).to be_successful

    new_favorite = JSON.parse(response.body, symbolize_names: true)
    expect(new_favorite[0][:title]).to eq("Title")
    expect(new_favorite[0][:favorite]).to eq(true)
  end
end