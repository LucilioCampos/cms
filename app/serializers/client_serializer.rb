class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :company, :email, :user_id, :notes, :status

  has_many :phones

end
