class UserSerializer < ActiveModel::Serializer
  attributes :id, :nome, :status, :tipo, :observacoes, :telefones


  def nome
    self.object.name
  end

  def tipo
    self.object.kind
  end

  def observacoes
    self.object.notes
  end

  def telefones
    self.object.phones.map do |phone, data={}|
      data.merge!(tipo: phone.kind,
      numero: phone.num,
      usuario: phone.user_id)
    end
  end

end
