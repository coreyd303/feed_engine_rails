class TripsController < ApplicationController

  def index
    @trip = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @invite = Invite.new
  end

  def new
    @trip   = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)
    if @trip.save
      flash[:notice] = "Your trip has been created bro!"
      redirect_to trip_path(@trip)
    else
      flash[:warning] = "Bummer bro, you trip ain't gonna happen!"
      redirect_to new_trips_path
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
                                 :trip_location)
  end
end
