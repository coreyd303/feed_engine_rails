class TripInviter < ActionMailer::Base
  default from: "mailer@snowcial.com"

  def invite(trip,user,to,from,subject,body)
    @user = user
    @trip = trip
    mail(to: to, from: from, subject: subject)
  end

end
