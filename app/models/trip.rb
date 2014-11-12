class Trip < ActiveRecord::Base
  has_and_belongs_to_many :users
  mount_uploader :coverphoto, CoverphotoUploader  
  has_many :instas

  def instagram
    self.users.each do |user|
      if user.instagram_id
       GetUserInstas.new.perform(user, self) 
      end
    end
  end
end
