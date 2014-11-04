class Api::V1::GroupsController < ApplicationController
  respond_to :json

  def index
    respond_with Group.all
  end

  def show
    respond_with Group.find(params[:id])
  end

  def create
    Group.create(safe_params)
    head :ok
  end

  def update
    group = Group.find(params[:id])
    group.update(safe_params)
    head :ok
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    head :ok
  end

private

  def safe_params
    params.require(:group).permit(:name, :description)
  end
end
