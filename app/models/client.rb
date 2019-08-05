class Client < ApplicationRecord
  belongs_to :user
  enum status: [:active, :inactive]
  has_many :phones
  has_many :addresses

  before_save do
    if self.phones.select(&:user_id).any?
      raise 'Esse telefone já pertence a outro usuário!'
    end
  end

  before_destroy do
    self.phones.map do |phone|
      phone.destroy!
    end
  end

  accepts_nested_attributes_for :phones, :addresses
end
