require 'rails_helper'

describe 'Events API' do
  it 'retrieves a specific event' do
    event = create(:event)

    get "/api/v1/events/#{event.id}.json"
    expect(response).to be_success

    expect(json['name']).to eq(event.name)
  end
end
