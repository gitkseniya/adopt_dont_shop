# frozen_string_literal: true

class RemoveCoverLetterFromApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :cover_letter, :string
  end
end
