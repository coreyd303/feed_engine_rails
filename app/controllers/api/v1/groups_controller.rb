class Api::V1::GroupsController < ApplicationController
  respond_to :json

  def index
    respond_with Group.all
  end

  def show
    respond_with Group.find(params[:id])
  end

  def create
    group = Group.new(group_params)

    if group.save
      render :json => group
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
