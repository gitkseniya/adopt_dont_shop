# frozen_string_literal: true

class DeleteColumnsFromPetApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :pet_applications, :cover_letter, :string
    remove_column :pet_applications, :status, :string
  end
end
