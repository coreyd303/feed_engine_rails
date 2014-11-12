class TripsController < ApplicationController
include ForecastHelper

  def index
    @trips = Trip.sort_by_date
  end

  def show
    @trip = Trip.find(params[:id])
    @invite = Invite.new
    @resort = Resort.find(@trip.resort_id)
    @instas = @trip.instas
    trip_forecast(@trip)
  end

  def new
    @trip = Trip.new
    @resorts = Resort.all
  end

  def create
    @trip = Trip.create(trip_params)
    if @trip.save
      flash[:success] = "Your trip has been created bro!"
      redirect_to trip_path(@trip)
    else
      flash[:warning] = "Bummer bro, your trip ain't gonna happen!"
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

  def join
    @trip = Trip.find(params[:id])
    @trip.add_user(current_user)
    redirect_to :back
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
