class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :client, optional: true

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
      end
    end
end
