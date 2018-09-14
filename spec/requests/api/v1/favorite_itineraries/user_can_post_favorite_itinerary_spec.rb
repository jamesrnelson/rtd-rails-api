require 'rails_helper'

describe 'POST /api/v1/users/:id/favorite_itineraries' do
  it 'can post a user\'s favorite itinerary' do
    user = User.create(email: 'example@example.com', uid: '1')
    itinerary = user.itinerary.create( start_address: "100 W. 14th Pkwy Denver CO 80204", end_address: "1331 17th St Denver CO")

    post 'api/v1/users/#{user.id}/favorite_itineraries', params: { start_address: itinerary.start_address, end_address: itinerary.end_address, favorite: true }

    expect(response).to be_successful

    new_favorite = JSON.parse(response.body, symbolize_names: true)
  end
end