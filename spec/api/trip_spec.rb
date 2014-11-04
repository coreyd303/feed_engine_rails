require 'rails_helper'

describe 'Trips API' do
  it 'retrieves a specific trip' do
    trip = create(:trip)

    get "/api/v1/trips/#{trip.id}.json"
    expect(response).to be_success

    expect(json['name']).to eq(trip.name)
  end

  it "can create a trip" do
    trip = build(:trip)
    json = trip.to_json
    count = Trip.count
    
    post "/api/v1/trips.json", json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}
    
    expect(Trip.count).to eq(count + 1)
    expect(response).to be_success
  end

  it "can update a trip" do
    trip = create(:trip)
    trip.name = "New name!"
    json = trip.to_json
    
    put "/api/v1/trips/#{trip.id}.json", json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}

    expect(response).to be_success
    expect(trip.name).to eq("New name!")
  end

  it "can destroy a trip" do
    trip = create(:trip)
    json = trip.to_json
    count = Trip.count
    
    delete "/api/v1/trips/#{trip.id}.json", json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}

    expect(response).to be_success
    expect(Trip.count).to eq(count - 1)
  end
end
