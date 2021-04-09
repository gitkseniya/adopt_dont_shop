# frozen_string_literal: true

class DropPetApplicationsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :pet_applications
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
