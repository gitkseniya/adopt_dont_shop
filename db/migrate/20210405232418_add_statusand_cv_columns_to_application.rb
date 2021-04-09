# frozen_string_literal: true

class AddStatusandCvColumnsToApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :status, :string
  end
end
