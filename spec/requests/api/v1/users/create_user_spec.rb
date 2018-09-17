require 'rails_helper'

describe 'POST /api/v1/users' do
  it 'should be able to create a user and return a user JSON object' do
    post '/api/v1/users', params: { username: 'booboooo', email: 'yes@ayeaye.com', uid: '123abc' }

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:username]).to eq('booboooo')
    expect(user[:email]).to eq('yes@ayeaye.com')
    expect(user[:uid]).to eq('123abc')
  end
end
