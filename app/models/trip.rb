class Trip < ActiveRecord::Base
  has_and_belongs_to_many :users

  def has_user?(user)
    users.include?(user)
  end

  def add_user(user)
    users << user
  end
end
