class Api::V1::TripsController < ApplicationController
  respond_to :json, :xml, :html

  def index
    respond_with Trip.all
  end

  def show
    respond_with Trip.find(params[:id])
  end

  def create
    Trip.create!(safe_params)
    head :ok
  end

  def update
    trip = Trip.find(params[:id])
    trip.update(safe_params)
    head :ok
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    head :ok
  end

private

  def safe_params
    params.require(:trip).permit(:name, 
                                 :description,  
                                 :date, 
                                 :trip_location,
                                 :resort_id)
  end
end
