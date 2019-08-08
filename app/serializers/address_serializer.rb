class AddressSerializer < ActiveModel::Serializer
  attributes :id, :state, :city, :neighborhood, :street, :notes, :client_id, :user_id
end
