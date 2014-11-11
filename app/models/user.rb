class User < ActiveRecord::Base
  has_and_belongs_to_many :trips
  has_many :instas
  mount_uploader :avatar, AvatarUploader

#  after_create :get_insta_id

  def has_epic_mix_data?
    epic_mix_username
  end

  def epic_mix_client
    @epic_mix_client = Epicmix::Client.new(epic_mix_username, 
                                  epic_mix_password)
  end

  def get_insta_id
    id = InstaGetId.new.perform(self.instagram_username)
    self.instagram_id = id
    self.save
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider         = auth["provider"]
      user.uid              = auth["uid"]
      user.name             = auth["info"]["name"]
      user.twitter_username  = auth["info"]["nickname"]
      user.image            = auth["info"]["image"]
    end
  end
end
