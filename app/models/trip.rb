class Trip < ActiveRecord::Base
  has_many   :users, through: :groups
  belongs_to :group

  def instagram
    self.users.each do |user|
      if user.instagram_id
       GetUserInstas.perform(user, self) 
      end
    end
  end
end
