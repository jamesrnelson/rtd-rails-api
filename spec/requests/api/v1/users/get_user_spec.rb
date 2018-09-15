require 'rails_helper'

describe 'GET /users/:uid' do
  it 'should be able to return a user by uid' do
    user = create(:user, uid: 'abc123')

    get "/api/v1/users/#{user.uid}"

    expect(response).to be_successful

    new_user = JSON.parse(response.body, symbolize_names: true)
    expect(new_user[:username]).to eq(user.username)
    expect(new_user[:email]).to eq(user.email)
    expect(new_user[:uid]).to eq('abc123')
  end
end
