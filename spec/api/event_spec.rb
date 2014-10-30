require 'rails_helper'

describe 'Events API' do
  it 'retrieves a specific event' do
    event = create(:event)

    get "/api/v1/events/#{event.id}.json"
    expect(response).to be_success

    expect(json['name']).to eq(event.name)
  end

  it "can create an event" do
    event = build(:event)
    json = event.to_json
    count = Event.count
    
    post "/api/v1/events.json", json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}
    
    expect(Event.count).to eq(count + 1)
    
    expect(response).to be_success
  end
end
