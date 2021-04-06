class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, length: { is: 2 }
  validates :zipcode, numericality: true
end
