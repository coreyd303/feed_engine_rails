class UserSerializer < ActiveModel::Serializer
  attributes :id, 
             :first_name,
             :last_name,
             :email,
             :instagram_username,
             :instagram_id,
             :twitter_username,
             :epic_mix_username,
             :epic_mix_password
 # has_many :instas

 # has_many :trips, 
 #          :groups
end

