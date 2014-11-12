class Trip < ActiveRecord::Base
  validates :resort_id, presence: true
  has_and_belongs_to_many :users
  mount_uploader :coverphoto, CoverphotoUploader
  has_one :resort
  

  def has_user?(user)
    users.include?(user)
  end

  def add_user(user)
    users << user
  end
end
