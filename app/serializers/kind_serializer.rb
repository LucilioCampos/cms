class KindSerializer < ActiveModel::Serializer
  attributes :id, :nome, :descricao
  
  def nome
    self.object.name
  end

  def descricao
    self.object.description
  end
end
