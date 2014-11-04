class InstaMostRecentPost
#  include Sidekiq::Worker

  def perform(user)
    feed = Instagram.user_recent_media(user.instagram_id)
    populate_from(feed, user.id)
  end

  def populate_from(feed, user_id)
    feed.each do |insta|
      #binding.pry
      Insta.create!(insta_id: insta['user']['id'].to_i,
                    user_id: user_id ,
                    insta_url: insta['link'],
                    thumbnail_url: insta['images']['thumbnail']['url'],
                    full_size_url: insta['images']['standard_resolution']['url'])
    end
  end
end
