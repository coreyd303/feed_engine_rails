class InstaMostRecentPost
#  include Sidekiq::Worker

  def perform(user_instagram_id)
    client.user_recent_media(user_instagram_id).first
  end
end
