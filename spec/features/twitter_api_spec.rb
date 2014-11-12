require 'rails_helper'

describe "Accessing Twitter's API" do
  it 'can retrieve tweets for a user' do
    visit 'https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=twitterapi&count=2'
  end
end
