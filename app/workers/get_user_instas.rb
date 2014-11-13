class GetUserInstas
  include Sidekiq::Worker
  attr_accessor :trip, :user

  def perform(user, trip)
    @trip    = trip
    @user    = user
    feed     = Instagram.get("https://api.instagram.com/v1/users/#{user.instagram_id}/media/recent", max_timestamp: max_time, min_timestamp: min_time)
    get_instas(feed, user, trip)
  end

  def get_instas(feed, user, trip)
    feed.map do |insta|
        Insta.new(insta_id: insta['user']['id'].to_i,
                      user_id: user.id,
                      trip_id: trip.id,
                      insta_url: insta['link'],
                      thumbnail_url: insta['images']['thumbnail']['url'],
                      full_size_url: insta['images']['standard_resolution']['url'])
    end
  end

  def max_time
   trip.date.end_of_day.to_i + (60 * 60 * 6)
  end
  
  def min_time
    trip.date.beginning_of_day.to_i + (60 * 60 * 6)
  end
end
