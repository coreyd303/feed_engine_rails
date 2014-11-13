class Trip < ActiveRecord::Base
  validates :name, :description, :date, :resort_id, presence: true
  has_and_belongs_to_many :users
  belongs_to :resort
  has_many :instas

  belongs_to :owner, class_name: 'User'

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
