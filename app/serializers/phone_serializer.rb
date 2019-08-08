class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :kind, :num, :user_id, :client_id

  def user_id
    return self.object.user_id if self.object.user_id.present?
  end

  def client_id
    return self.object.client_id if self.object.client_id.present?
  end

end
