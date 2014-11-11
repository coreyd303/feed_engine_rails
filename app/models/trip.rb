class Trip < ActiveRecord::Base
  has_and_belongs_to_many   :users
  has_many :instas

  def instagram
    self.users.each do |user|
      if user.instagram_id
       GetUserInstas.perform(user, self) 
      end
    end
  end
end
