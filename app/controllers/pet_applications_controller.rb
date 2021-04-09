# frozen_string_literal: true

class PetApplicationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    application = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    PetApplication.create(pet_id: pet.id, application_id: application.id)

    redirect_to "/applications/#{application.id}"
  end
end
