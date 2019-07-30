class Document < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :cliente, optional: true
end
