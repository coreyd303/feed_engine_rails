require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do

  before do
    15.times do
      create(:trip)
    end

    @resort = create(:resort)
    @trip   = Trip.first
    @trips  = Trip.all
  end

  describe "GET index" do
    it 'assigns @trips' do
      get :index
      expect(assigns(:trips)).to eq(@trips)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
