class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :trips, through: :group

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
