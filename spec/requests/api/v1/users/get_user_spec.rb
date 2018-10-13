require 'rails_helper'

describe 'GET /users/:uid' do
  it 'should be able to return a user by uid' do
    user = create(:user, uid: 'abc123')
    favorite = user.itineraries.create(
      start_address: '12 Cedar Place, Denver, CO',
      end_address: '1331 17th St, Denver, CO',
      favorite: true
    )
    recent_search = user.itineraries.create(
      start_address: 'Denver International Airport',
      end_address: '12 Cedar Place, Denver, CO'
    )

    get "/api/v1/users/#{user.uid}"

    expect(response).to be_successful

    info = JSON.parse(response.body, symbolize_names: true)
    expect(info[:user][:username]).to eq(user.username)
    expect(info[:user][:email]).to eq(user.email)
    expect(info[:user][:uid]).to eq('abc123')
    expect(info[:favorites][0][:start_address]).to eq(favorite.start_address)
    expect(info[:favorites][0][:end_address]).to eq(favorite.end_address)
    expect(info[:favorites][0][:favorite]).to eq(true)
    expect(info[:recent_searches][0][:start_address]).to eq(recent_search.start_address)
    expect(info[:recent_searches][0][:end_address]).to eq(recent_search.end_address)
    expect(info[:recent_searches][0][:favorite]).to eq(false)
  end
end
