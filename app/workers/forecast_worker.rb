require 'sidekiq'
require 'sidekiq/testing/inline'

class ForecastWorker
  include Sidekiq::Worker

  attr_accessor :latitude,
                :longitude,
                :time

  def perform(trip_id)
    binding.pry
    trip = Trip.find(trip_id.to_i)
    find_trip_location(trip)
    find_trip_date(trip)
    forecast_hash
  end
  
  def forecast_hash
    forecast = ForecastIO.forecast(@latitude, @longitude, time: @time.to_i)
    {'weather' => [
      {'summary' => forecast[:hourly][:summary]},
      {'precipitation' => forecast[:currently][:precipType]},
      {'temperature' => forecast[:currently][:temperature]},
      {'wind_speed' => forecast[:currently][:windSpeed]}]
    }
  end

  def find_trip_location(trip)
    resort     = Resort.find(trip.resort_id)
    @latitude  = resort.lat
    @longitude = resort.lng
  end

  def find_trip_date(trip)
    @time = trip.date
  end
end
