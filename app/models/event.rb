class Event < ActiveRecord::Base
  has_many   :users, through: :groups
  belongs_to :group
end
