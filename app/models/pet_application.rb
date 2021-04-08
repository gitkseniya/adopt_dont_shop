class PetApplication < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  validates :pet_id, numericality: true
  validates :application_id, numericality: true
  # validates_length_of :cover_letter, minimum: 10 #, on: :create
end
