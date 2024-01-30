class AlertSerializer < ActiveModel::Serializer
  attributes :id, :status, :price
  has_one :coin
end
