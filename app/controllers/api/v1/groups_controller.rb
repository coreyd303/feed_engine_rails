class Api::V1::GroupsController < ApplicationController
  respond_to :json

  def index
    respond_with Group.all
  end

  def show
    respond_with Group.find(params[:id])
  end
end
