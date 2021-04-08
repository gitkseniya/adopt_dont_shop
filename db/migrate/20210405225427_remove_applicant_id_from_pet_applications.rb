class RemoveApplicantIdFromPetApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :pet_applications, :applicant_id, :integer
  end
end
