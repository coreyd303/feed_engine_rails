class TripInviter < ActionMailer::Base
  default from: "friendlypostman@snowcial.com"

  def invite(trip,user,to,subject,body)
    @user = user
    @trip = trip
    mail(to: to, subject: subject)
  end

end
