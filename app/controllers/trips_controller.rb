class TripsController < ApplicationController
include ForecastHelper

  def index
    @trip = Trip.all
  end

  def show
    @trip   = Trip.find(params[:id])
    @resort = Resort.find(params[:id][@trip.resort_id])
    trip_forecast(@trip)
  end

  def new
    @resorts = Resort.all
    @trip    = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)
    if @trip.save
      flash[:success] = "Your trip has been created bro!"
      redirect_to trip_path(@trip)
    else
      flash[:warning] = "Bummer bro, you trip ain't gonna happen!"
      redirect_to new_trips_path
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    flash[:success] = "Werd bro, your trip is totally up to date!"
    redirect_to trip_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
  end

private

  def trip_params
    params.require(:trip).permit(:name,
                                 :description,
                                 :date,
                                 :resort_id,
                                 :coverphoto)
  end
end
