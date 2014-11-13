class InvitesController < ApplicationController
  def create
    @invite = Invite.new(safe_params)
    TripInviter.invite(@invite.trip,
                       @invite.user = current_user,
                       @invite.to,
                       @invite.subject,
                       @invite.body
                       ).deliver
    
    redirect_to :back, notice: "Your email has been sent!"
  end

  private

  def safe_params
    new_params        = params.require(:invite).permit(:trip, 
                                                       :user, 
                                                       :to, 
                                                       :from, 
                                                       :subject, 
                                                       :body)
    
    new_params[:trip] = Trip.find(params[:invite][:trip])
    new_params
  end
end