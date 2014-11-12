require 'rails_helper'

describe 'User API' do
  it 'retrieves a specific user' do
    user = create(:user)

    get "/api/v1/users/#{user.id}.json"
    expect(response).to be_success

    expect(user['name']).to eq(user.name)
  end

  it "can create a user" do
    user = build(:user)
    json = user.to_json
    count = User.count
    
    post "/api/v1/users.json", json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}
    
    expect(User.count).to eq(count + 1)
    expect(response).to be_success
  end

  it "can update a user" do
    user = create(:user)
    user.name = "New name!"
    json = user.to_json
    
    put "/api/v1/users/#{user.id}.json", json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}

    expect(response).to be_success
    expect(user.name).to eq("New name!")
  end

  it "can destroy a user" do
    user = create(:user)
    json = user.to_json
    count = User.count
    
    delete "/api/v1/users/#{user.id}.json", json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}

    expect(response).to be_success
    expect(User.count).to eq(count - 1)
  end
end
