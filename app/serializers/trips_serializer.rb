class TripsSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id,
             :name,
             :description,
             :trip_location,
             :date
             
  has_many :users
end
