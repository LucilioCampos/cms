class ClientSerializer < ActiveModel::Serializer
  attributes :id, :nome, :organizacao, :email, :vendedor, :observacoes, :status

  def nome
    self.object.name
  end

  def organizacao
    self.object.company
  end

  def vendedor
    self.object.user_id
  end

  def observacoes
    self.object.notes
  end

end
