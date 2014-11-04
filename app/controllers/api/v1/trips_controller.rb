class Api::V1::TripsController < ApplicationController
  respond_to :json

  def index
    respond_with Trip.all
  end

  def show
    # @trip = Trip.find(params[:id])
    respond_with Trip.find(params[:id])
  end

  def create
    @trip = Trip.create!(safe_params)
    render :json => @trip
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(safe_params)
    render :json => @trip
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    head :ok
  end

  def safe_params
    params.require(:trip).permit(:name, :description, :group_id, :start_time, :end_time, :location)
  end
end
