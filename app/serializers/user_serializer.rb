class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, 
             :name,
             :instagram_username,
             :instagram_id,
             :twitter_username 
  has_many :instas, :trips
end
