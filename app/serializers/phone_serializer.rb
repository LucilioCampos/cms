class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :kind, :num
  belongs_to :user
  belongs_to :client
end
