class TripsSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :date
end
