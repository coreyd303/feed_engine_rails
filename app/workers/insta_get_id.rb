class InstaGetId
#  include Sidekiq::Worker

  def perform(user_instagram_name)
    client = Rails.application.config.instagram
    client.user_search(user_instagram_name).first.id
  end
end

