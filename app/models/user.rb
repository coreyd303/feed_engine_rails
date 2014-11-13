class User < ActiveRecord::Base
  has_and_belongs_to_many :trips
  has_many :instas

  has_many :trips, foreign_key: :owner_id
  
  mount_uploader :avatar, AvatarUploader

  after_create :get_insta_id

  def has_epic_mix_data?
    epic_mix_username != nil
    epic_mix_password != nil
  end

  def epic_mix_client
    @epic_mix_client = Epicmix::Client.new(epic_mix_username, 
                                           epic_mix_password)
  end

  def get_tweets(date)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Figaro.env.twitter_id 
      config.consumer_secret     = Figaro.env.twitter_secret 
      config.access_token        = Figaro.env.twitter_access_token 
      config.access_token_secret = Figaro.env.twitter_access_token_secret
    end

    tweets = client.user_timeline(twitter_username)
    tweets.select { |t| t.created_at.strftime('%m/%d/%Y') == date.strftime('%m/%d/%Y') }
  end

  def get_insta_id
    if self.instagram_username
      id = InstaGetId.new.perform(self.instagram_username)
      self.instagram_id = id
      self.save
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider          = auth["provider"]
      user.uid               = auth["uid"]
      user.name              = auth["info"]["name"]
      user.email             = auth["info"]["email"]
      user.twitter_username  = auth["info"]["nickname"]
      user.image            = auth["info"]["image"]
    end
  end

  def self.find_matches(query)
    query = query.downcase
    where("lower(name) like ?", "%#{query}%")
  end
end
