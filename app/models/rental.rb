class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :reservation_date, presence: true
end
