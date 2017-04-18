class HouseSerializer < ActiveModel::Serializer
  attributes :id, :listing_id
  belongs_to :user
end
