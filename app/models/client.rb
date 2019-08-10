class Client < ApplicationRecord
  belongs_to :user, optional: true
  enum status: [:active, :inactive]
  has_many :phones, dependent: :destroy
  has_many :addresses
  has_many :documents

  before_save do
    if self.phones.select(&:user_id).any?
      raise 'Esse telefone já pertence a outro usuário!'
    end
  end

  before_destroy do
    self.addresses.map do |address|
      if address.client_id == self.id
        address.client_id = nil
        address.save!
      end
    end

    self.phones.map do |phone|
      phone.destroy!
    end

    self.user = nil
  end

  accepts_nested_attributes_for :phones, :addresses, :documents
end
