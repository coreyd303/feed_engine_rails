require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :api do
include ApiHelper

  before(:each) do
    @user  = create(:user)
    @json  = @user.to_json
    @count = User.count
  end

  describe 'User API' do
    it 'retrieves a specific user' do
      get "/api/v1/users/#{@user.id}.json"
      last_response.status.should eql(200)

      expect(@user['name']).to eq(@user.name)
    end

    it "can create a user" do
      post "/api/v1/users.json", @json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}
      
      expect(User.count).to eq(@count + 1)
      last_response.status.should eql(200)
    end

    it "can update a user" do
      @user.name = "New name!"
      json = @user.to_json
      
      put "/api/v1/users/#{@user.id}.json", @json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}

      last_response.status.should eql(200)
      expect(@user.name).to eq("New name!")
    end

    it "can destroy a user" do      
      delete "/api/v1/users/#{@user.id}.json", @json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}

      last_response.status.should eql(200)
      expect(User.count).to eq(@count - 1)
    end
  end
end