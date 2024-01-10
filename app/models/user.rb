class User < ApplicationRecord
  has_many :restaurants, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :rents_as_owner, through: :restaurants, source: :rentals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
