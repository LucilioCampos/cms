class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :kind, :num, :user_id, :client_id
end
