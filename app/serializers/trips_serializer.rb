class TripsSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :trip_location, :date
end
