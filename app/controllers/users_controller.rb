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
    flash[:notice] = "Your profile is totally legit bro!"
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "Your profile has be updated bro!"
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Your profile has been abolished"
    redirect_to users_path
  end

private

  def user_has_trips?(user)
    if user.trips != nil
      @user_trips = user.trips
    end
  end

  def user_params
    params.require(:user).permit(:name, 
                                 :email,
                                 :avatar,
                                 :epic_mix_username, 
                                 :epic_mix_password)
  end

end

