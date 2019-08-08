class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :client, optional: true
  has_one :service_address
  enum state: [ 
    "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", 
    "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", 
    "RJ", "RN", "RO", "RS", "RR", "SC", "SE", "SP", "TO"
  ]

  before_save do
   validate_user_or_client
  end

  before_create do
    validate_user_or_client
  end

  private
    def validate_user_or_client
      if self.user_id.present? && self.client_id.present?
        raise "Esse endereço só pode ser atribuido a uma pessoa"
        self.cancel
      end
    end
end
