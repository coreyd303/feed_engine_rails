require 'epicmix'

class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @trips = @user.trips
    @client = Epicmix::Client.new(@user.epic_mix_username, 
                                  @user.epic_mix_password)
  end

  def new
    @user = User.new  
  end

  def create
    @user = User.create!(user_params)
    redirect_to user_path(@user)
  end

private

  def user_params
    params.require(:user).permit(:name, 
                                 :email, 
                                 :epic_mix_username, 
                                 :epic_mix_password)
  end

end

