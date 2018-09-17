require 'rails_helper'

describe 'PUT /api/v1/users/:id/favorite_itinerary' do
  it "can edit a user's favorite itinerary" do
    user = create(:user, uid: 'abc123')
  end
end