module TripsHelper
  def user_can_join(trip)
    current_user && trip.users.none? { |u| u == current_user }
  end  
end
