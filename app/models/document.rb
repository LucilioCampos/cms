class Document < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :cliente, optional: true

  enum kind: [:cpf, :rg, :cne]
  validates_uniqueness_of :num

end
