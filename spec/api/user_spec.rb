require 'rails_helper'

describe 'User API' do
  it 'retrieves a specific user' do
    user = create(:user)

    get "/api/v1/users/#{user.id}.json"
    expect(response).to be_success

    expect(json['first_name']).to eq(user.first_name)
  end
end
