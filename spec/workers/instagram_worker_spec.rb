require 'rails_helper'

describe InstaGetId do
  let(:user) { create(:user, instagram_username: 'BroGnarly420') }

  let(:mock) do
  class MockInstaGetId
    Result = Struct.new :id

    attr_reader :instagram_id

    def initialize(id)
      @id = id
    end

    def perform(user_instagram_name)
      @user_instagram_name = user_instagram_name
      Result.new @id 
    end
  end
  end

  it "can get an id from a username" do
    # mock = MockInstaGetId.new('name')
    mock
    Rails.application.config.instagram = mock
    
    expect(user.instagram_id).to eq(420)
  end

  it "gets the most recent post for a user" do
#    mock = MockInstaMostRecent.new('some string')
#    Rails.application.config.instagram = mock

#    expect #the most recent instagram picture to be some string
  end
end
