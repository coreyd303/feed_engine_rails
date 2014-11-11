module ForecastHelper
attr_reader :latitude, :longitude, :time

  def trip_forecast(trip)
    find_trip_location(trip)
    find_trip_date(trip)
    @forecast = ForecastIO.forecast(@latitude, @longitude, time: @time.to_i)
  end

  def find_trip_location(trip)
    resort     = Resort.find(params[:id][trip.resort_id])
    @latitude  = resort.lat
    @longitude = resort.lng
  end

  def find_trip_date(trip)
    @time = trip.date
  end
end