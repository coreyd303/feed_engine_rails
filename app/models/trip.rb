class Trip < ActiveRecord::Base
  has_and_belongs_to_many :users
  mount_uploader :coverphoto, CoverphotoUploader
end
