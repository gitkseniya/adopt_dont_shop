class AddColumnsToPetApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :pet_applications, :status, :string
    add_column :pet_applications, :cover_letter, :string
  end
end
