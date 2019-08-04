class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :tipo, :numero, :id_usuario

  def tipo
    self.object.kind
  end

  def numero
    self.object.num
  end

  def id_usuario
    self.object.user_id
  end
end
