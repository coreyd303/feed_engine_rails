class Api::V1::EventsController < ApplicationController
  respond_to :json
  
  def show
    @event = Event.find(params[:id])
    respond_with :json => @event
  end

  def create
    @event = Event.create!(safe_params)
    render :json => @event
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
