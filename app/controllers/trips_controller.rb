class TripsController < ApplicationController

  def index
    @trip = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:notice] = "Your trip has been created bro!"
      redirect_to trip_path(@trip)
    else
      flash[:warning] = "Bummer bro, you trip ain't gonna happen!"
    end
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update!
    flash[:notice] = "Werd bro, your trip is totally up to date!"
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
                                 :location)
  end
end
