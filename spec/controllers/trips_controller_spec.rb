require 'rails_helper'
require 'rails_helper'

RSpec.describe TripsController, :type => :controller do
include SpecBuilders

  before(:each) do
    @trip = make_trip
  end

  describe "GET index" do
    it 'assigns @trips' do
      get :index
      expect(assigns(:trips)).to eq([@trips])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'assigns @trip @resort and @instas' do
      get :show, id: @trip.id
      expect(assigns(:trip)).to   eq(@trip)
      expect(assigns(:resort)).to eq(@resort)
      expect(assigns(:instas)).to eq(@instas)
    end

    it 'renders the show template' do
      get :show, id: @trip.id
      expect(response).to render_template('show')
    end
  end
end

