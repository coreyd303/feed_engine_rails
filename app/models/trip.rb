class Trip < ActiveRecord::Base
  has_and_belongs_to_many :users
#  has_many   :users, through: :groups
end
