class Trip < ActiveRecord::Base
  validates :resort_id, presence: true
  
  has_and_belongs_to_many :users
  has_one :resort
  has_many :instas

  mount_uploader :coverphoto, CoverphotoUploader

  def has_user?(user)
    users.include?(user)
  end

  def add_user(user)
    users << user
  end

  def instagram
    self.users.each do |user|
      if user.instagram_id
       GetUserInstas.new.perform(user, self) 
      end
    end
  end

  def get_tweets(date)
    tweets = users.map do |user|
      user.get_tweets(date)
    end
    tweets.flatten.sort_by { |t| t.created_at }.reverse
  end

  def self.sort_by_date
    all.sort_by { |trip| trip.date }
  end
end
