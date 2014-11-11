class Trip < ActiveRecord::Base
  has_and_belongs_to_many :users
  mount_uploader :coverphoto, CoverphotoUploader

  def trip_forcast
    ForecastIO.forecast(37.8267, -122.423, time: Time.new(2013, 3, 11).to_i)
  end

  def trip_location
    @latitude  
    @longitude 
  end

  def trip_date
    # takes trip date and objectifies it and passes to trip_forcast method
    Time.new(2013, 3, 11).to_i
  end
end
