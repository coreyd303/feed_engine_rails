class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :trips, through: :group
  has_many :instas

  after_create :get_insta_id

  def get_insta_id
    id = InstaGetId.new.perform(self.instagram_username)
    self.instagram_id = id
    self.save
  end
end
