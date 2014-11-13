require 'active_model'

class Invite
  include ActiveModel::Model
  attr_accessor :trip, 
                :user, 
                :from, 
                :to, 
                :subject, 
                :body
end