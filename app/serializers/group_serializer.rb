class GroupSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :description
  has_many :trips
end
