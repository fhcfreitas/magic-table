class Restaurant < ApplicationRecord
  CATEGORY = ["Bar", "Boteco", "Buffet", "Restaurante", "Quiosque", "Rodízio"]

  validates :name, :location, :address, :category, presence: true
  validates :category, inclusion: { in: CATEGORY }

  belongs_to :user
  has_many :rentals, dependent: :destroy
end
