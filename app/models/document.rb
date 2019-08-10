class Document < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :cliente, optional: true

  enum kind: [:cpf, :rg, :cne]
  validates_uniqueness_of :num

  before_save do
    if self.user_id && self.client_id
      raise 'Não é possível cadastrar o mesmo documento para duas pessoas'
      self.cancel
    end
  end

end
