class Api::V1::GroupsController < ApplicationController
  respond_to :json

  def index
    # groups = Group.all
    respond_with Group.all
    # respond_with Trip.all
  end

  def show
    # @group = Group.find(params[:id])
    respond_with Group.find(params[:id])
    # respond_with Item.find(params[:id])
  end

  def create
    @group = Group.create(safe_params)
    render :json => @group
  end

  def update
    @group = Group.find(params[:id])
    @group.update(safe_params)
    render :json => @group
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
