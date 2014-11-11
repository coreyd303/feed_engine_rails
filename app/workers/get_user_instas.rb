class GetUserInstas
#  include Sidekiq::Worker
  attr_accessor :trip, :user

  def perform(user, trip)
    feed = Instagram.get("https://api.instagram.com/v1/users/#{user.instagram_id}/media/recent/?max_timestamp=#{max_time}&min_timestamp=#{min_time}")
    populate_from(feed, user, trip)
    @trip = trip
    @user = user
  end

  def save_instas(feed, user, trip)
    feed.each do |insta|
      unless Insta.where(insta_url = insta['link'])
        Insta.create!(insta_id: insta['user']['id'].to_i,
                      user_id: user.id,
                      trip_id: trip.id,
                      insta_url: insta['link'],
                      thumbnail_url: insta['images']['thumbnail']['url'],
                      full_size_url: insta['images']['standard_resolution']['url'])
      end
    end
  end

  def max_time
    time = DateTime.new(trip.date)
    time.hour = 24
    time.to_i
  end
  
  def min_time
    time = DateTime.new(trip.date)
    time.hour = 0
    time.to_i
  end
end
