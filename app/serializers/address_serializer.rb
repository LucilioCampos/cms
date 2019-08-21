class AddressSerializer < ActiveModel::Serializer
  attributes :id, :state, :city, :neighborhood, :street, :cep, :notes, :client_id, :user_id
end
