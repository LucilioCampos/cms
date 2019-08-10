class Phone < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :client, optional: true
  enum kind: [:fix, :comercial, :home]

  validates :kind, presence: true
  validates :num, presence: true

  before_save do 

    if self.user_id && self.client_id
      raise 'Telefone só pode pertencer a um usuário ou a um cliente'
      self.cancel
    end

  end

end
