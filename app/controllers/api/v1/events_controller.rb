class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.create(safe_params)
  end

  def update
    @event = Event.find(params[:id])
    @event.update(safe_params)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  def safe_params 
    params.require(:event).permit(:name, :description, :group_id, :start_time, :end_time, :location)
  end
end
