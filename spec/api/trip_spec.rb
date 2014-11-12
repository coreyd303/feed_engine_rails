require 'rails_helper'

RSpec.describe Api::V1::TripsController, :type => :api do
include SpecBuilders
include ApiHelper

  before(:each) do
    @trip  = make_trip
    @json  = @trip.to_json
    @count = Trip.count
  end

  describe 'Trips API' do
    it 'retrieves a specific trip' do
      get %Q{/api/v1/trips/#{@trip.id}.json}

      last_response.status.should eql(200)

      expect(@trip['name']).to eq(@trip.name)
    end

    it "can create a trip" do      
      post %Q{/api/v1/trips.json}, @json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}

      expect(Trip.count).to eq(@count + 1)
      last_response.status.should eql(200)
    end

    it "can update a trip" do
      @trip.name = "New name!"
      
      put %Q{/api/v1/trips/#{@trip.id}.json}, @json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}

      last_response.status.should eql(200)

      expect(@trip.name).to eq("New name!")
    end

    it "can destroy a trip" do      
      delete %Q{/api/v1/trips/#{@trip.id}.json}, @json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}

      last_response.status.should eql(200)

      expect(Trip.count).to eq(@count - 1)
    end
  end
end