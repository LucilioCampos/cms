class Schedule < ApplicationRecord
  belongs_to :sale
  enum status: [:scheduled, :finished]
end
