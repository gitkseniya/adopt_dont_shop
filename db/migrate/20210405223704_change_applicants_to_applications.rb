# frozen_string_literal: true

class ChangeApplicantsToApplications < ActiveRecord::Migration[5.2]
  def change
    rename_table :applicants, :applications
  end
end
