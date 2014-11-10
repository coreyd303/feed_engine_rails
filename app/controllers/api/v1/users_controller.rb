require 'epicmix'

class Api::V1::UsersController < ApplicationController
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    User.create!(safe_params)
    head :ok
  end

  def update
    user = User.find(params[:id])
    user.update(safe_params)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head :ok
  end

private

  def safe_params
    params.require(:user).permit(:name,
                                 :email,
                                 :instagram_username,
                                 :instagram_id, 
                                 :twitter_username, 
                                 :epic_mix_username, 
                                 :epic_mix_password,
                                 :provider,
                                 :uid,
                                 :image
                                )
  end
end
