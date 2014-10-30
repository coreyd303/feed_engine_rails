class Api::V1::GroupsController < ApplicationController
  respond_to :json
  
  def show
    @group = Group.find(params[:id])
    respond_with :json => @group
  end

  def create
    @group = Group.create(safe_params)
    render :json => @trip
  end

  def update
    @group = Group.find(params[:id])
    @group.update(safe_params)
    render :json => @trip
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    head :ok
  end

  def safe_params 
    params.require(:group).permit(:name, :description)
  end
end
