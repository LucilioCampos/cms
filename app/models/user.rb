class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  alias authenticate valid_password?
         
  has_many :addresses
  has_many :phones, dependent: :destroy
  has_many :sales
  has_many :documents
  has_many :traffic_statuses
  has_many :clients
  enum kind: [:manager, :salesman]
  enum status: [:active, :inactive]
  

  scope :search_name, -> (name) { where("name like ?", "#{name}%")}
  scope :campos, -> (filter) { select(filter) }

  before_save do
    if self.phones.select(&:client_id).any?
      raise 'Esse telefone já pertence a outro usuário!'
      self.cancel
    end
  end

  before_destroy do
    self.phones.map do |phone|
      phone.destroy!
    end

    self.clients.map do |client|
      client.user_id = nil
      client.save!
    end

    self.addresses.map do |address|
      if address.user_id == self.id
        address.user_id = nil
        address.save!
      end
    end

  end

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :documents, allow_destroy: true

end
