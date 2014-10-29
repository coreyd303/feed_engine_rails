class Api::V1::UsersController < ApplicationController
  respond_to :json

  def show
    @user = User.find(params[:id])
    respond_with :json => @user
  end

  def create
    @user = User.create(safe_params)
  end

  def update
    @user = User.find(params[:id])
    @user.update(safe_params)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def safe_params
    params.require(:user).permit(:first_name, :last_name, :email, :instagram_username,
                                 :instagram_id, :twitter_username, :epic_mix_username, 
                                 :epic_mix_password)
  end
end
