class AddCvColumnToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :cover_letter, :string
    change_column_default :applications, :cover_letter, " "
  end
end
